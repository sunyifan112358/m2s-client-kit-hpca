/* ============================================================

   Copyright (c) 2009 Advanced Micro Devices, Inc.  All rights reserved.

   Redistribution and use of this material is permitted under the following 
conditions:

Redistributions must retain the above copyright notice and all terms of this 
license.

In no event shall anyone redistributing or accessing or using this material 
commence or participate in any arbitration or legal action relating to this 
material against Advanced Micro Devices, Inc. or any copyright holders or 
contributors. The foregoing shall survive any expiration or termination of 
this license or any agreement or access or use related to this material. 

ANY BREACH OF ANY TERM OF THIS LICENSE SHALL RESULT IN THE IMMEDIATE REVOCATION 
OF ALL RIGHTS TO REDISTRIBUTE, ACCESS OR USE THIS MATERIAL.

THIS MATERIAL IS PROVIDED BY ADVANCED MICRO DEVICES, INC. AND ANY COPYRIGHT 
HOLDERS AND CONTRIBUTORS "AS IS" IN ITS CURRENT CONDITION AND WITHOUT ANY 
REPRESENTATIONS, GUARANTEE, OR WARRANTY OF ANY KIND OR IN ANY WAY RELATED TO 
SUPPORT, INDEMNITY, ERROR FREE OR UNINTERRUPTED OPERA TION, OR THAT IT IS FREE 
FROM DEFECTS OR VIRUSES.  ALL OBLIGATIONS ARE HEREBY DISCLAIMED - WHETHER 
EXPRESS, IMPLIED, OR STATUTORY - INCLUDING, BUT NOT LIMITED TO, ANY IMPLIED 
WARRANTIES OF TITLE, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, 
ACCURACY, COMPLETENESS, OPERABILITY, QUALITY OF SERVICE, OR NON-INFRINGEMENT. 
IN NO EVENT SHALL ADVANCED MICRO DEVICES, INC. OR ANY COPYRIGHT HOLDERS OR 
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, PUNITIVE,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, REVENUE, DATA, OR PROFITS; OR 
BUSINESS INTERRUPTION) HOWEVER CAUSED OR BASED ON ANY THEORY OF LIABILITY 
ARISING IN ANY WAY RELATED TO THIS MATERIAL, EVEN IF ADVISED OF THE POSSIBILITY 
OF SUCH DAMAGE. THE ENTIRE AND AGGREGATE LIABILITY OF ADVANCED MICRO DEVICES, 
INC. AND ANY COPYRIGHT HOLDERS AND CONTRIBUTORS SHALL NOT EXCEED TEN DOLLARS 
(US $10.00). ANYONE REDISTRIBUTING OR ACCESSING OR USING THIS MATERIAL ACCEPTS 
THIS ALLOCATION OF RISK AND AGREES TO RELEASE ADVANCED MICRO DEVICES, INC. AND 
ANY COPYRIGHT HOLDERS AND CONTRIBUTORS FROM ANY AND ALL LIABILITIES, 
OBLIGATIONS, CLAIMS, OR DEMANDS IN EXCESS OF TEN DOLLARS (US $10.00). THE 
FOREGOING ARE ESSENTIAL TERMS OF THIS LICENSE AND, IF ANY OF THESE TERMS ARE 
CONSTRUED AS UNENFORCEABLE, FAIL IN ESSENTIAL PURPOSE, OR BECOME VOID OR 
DETRIMENTAL TO ADVANCED MICRO DEVICES, INC. OR ANY COPYRIGHT HOLDERS OR 
CONTRIBUTORS FOR ANY REASON, THEN ALL RIGHTS TO REDISTRIBUTE, ACCESS OR USE 
THIS MATERIAL SHALL TERMINATE IMMEDIATELY. MOREOVER, THE FOREGOING SHALL 
SURVIVE ANY EXPIRATION OR TERMINATION OF THIS LICENSE OR ANY AGREEMENT OR 
ACCESS OR USE RELATED TO THIS MATERIAL.

NOTICE IS HEREBY PROVIDED, AND BY REDISTRIBUTING OR ACCESSING OR USING THIS 
MATERIAL SUCH NOTICE IS ACKNOWLEDGED, THAT THIS MATERIAL MAY BE SUBJECT TO 
RESTRICTIONS UNDER THE LAWS AND REGULATIONS OF THE UNITED STATES OR OTHER 
COUNTRIES, WHICH INCLUDE BUT ARE NOT LIMITED TO, U.S. EXPORT CONTROL LAWS SUCH 
AS THE EXPORT ADMINISTRATION REGULATIONS AND NATIONAL SECURITY CONTROLS AS 
DEFINED THEREUNDER, AS WELL AS STATE DEPARTMENT CONTROLS UNDER THE U.S. 
MUNITIONS LIST. THIS MATERIAL MAY NOT BE USED, RELEASED, TRANSFERRED, IMPORTED,
EXPORTED AND/OR RE-EXPORTED IN ANY MANNER PROHIBITED UNDER ANY APPLICABLE LAWS, 
INCLUDING U.S. EXPORT CONTROL LAWS REGARDING SPECIFICALLY DESIGNATED PERSONS, 
COUNTRIES AND NATIONALS OF COUNTRIES SUBJECT TO NATIONAL SECURITY CONTROLS. 
MOREOVER, THE FOREGOING SHALL SURVIVE ANY EXPIRATION OR TERMINATION OF ANY 
LICENSE OR AGREEMENT OR ACCESS OR USE RELATED TO THIS MATERIAL.

NOTICE REGARDING THE U.S. GOVERNMENT AND DOD AGENCIES: This material is 
provided with "RESTRICTED RIGHTS" and/or "LIMITED RIGHTS" as applicable to 
computer software and technical data, respectively. Use, duplication, 
distribution or disclosure by the U.S. Government and/or DOD agencies is 
subject to the full extent of restrictions in all applicable regulations, 
including those found at FAR52.227 and DFARS252.227 et seq. and any successor 
regulations thereof. Use of this material by the U.S. Government and/or DOD 
agencies is acknowledgment of the proprietary rights of any copyright holders 
and contributors, including those of Advanced Micro Devices, Inc., as well as 
the provisions of FAR52.227-14 through 23 regarding privately developed and/or 
commercial computer software.

This license forms the entire agreement regarding the subject matter hereof and 
supersedes all proposals and prior discussions and writings between the parties 
with respect thereto. This license does not affect any ownership, rights, title,
     or interest in, or relating to, this material. No terms of this license can be 
     modified or waived, and no breach of this license can be excused, unless done 
     so in a writing signed by all affected parties. Each term of this license is 
     separately enforceable. If any term of this license is determined to be or 
     becomes unenforceable or illegal, such term shall be reformed to the minimum 
     extent necessary in order for this license to remain in effect in accordance 
     with its terms as modified by such reformation. This license shall be governed 
     by and construed in accordance with the laws of the State of Texas without 
     regard to rules on conflicts of law of any state or jurisdiction or the United 
     Nations Convention on the International Sale of Goods. All disputes arising out 
     of this license shall be subject to the jurisdiction of the federal and state 
     courts in Austin, Texas, and all defenses are hereby waived concerning personal 
     jurisdiction and venue of these courts.

     ============================================================ */


#include "DwtHaar1D.hpp"
#include <math.h>


void DwtHaar1D::calApproxFinalOnHost()
{
	/* Copy inData to hOutData */
	cl_float *tempOutData = (cl_float*)malloc(signalLength * sizeof(cl_float));
	if(tempOutData == NULL) 
	{ 
		sampleCommon->error("Failed to allocate host memory. (tempOutData)");
	}
	memcpy(tempOutData, inData, signalLength * sizeof(cl_float));

	for(cl_uint i = 0; i < signalLength; ++i)
	{
		tempOutData[i] = tempOutData[i] / sqrt((float)signalLength);
	}

	cl_uint length = signalLength;
	while(length > 1u)
	{
		for(cl_uint i = 0; i < length / 2; ++i)
		{
			cl_float data0 = tempOutData[2 * i];
			cl_float data1 = tempOutData[2 * i + 1];

			hOutData[i] = (data0 + data1) / sqrt((float)2);
			hOutData[length / 2 + i] = (data0 - data1) / sqrt((float)2);
		}
		/* Copy inData to hOutData */
		memcpy(tempOutData, hOutData, signalLength * sizeof(cl_float));

		length >>= 1;
	}

	free(tempOutData);
}


int DwtHaar1D::getLevels(unsigned int length, unsigned int* levels)
{
	cl_int returnVal = CL_FALSE;

	for(unsigned int i = 0; i < 24; ++i)
	{
		if(length == (1 << i))
		{
			*levels = i;
			returnVal = CL_TRUE;
			break;
		}
	}

	return returnVal;
}

int DwtHaar1D::setupDwtHaar1D()
{
	/* signal length must be power of 2 */
	signalLength = sampleCommon->roundToPowerOf2<cl_uint>(signalLength);

	unsigned int levels = 0;
	int result = getLevels(signalLength, &levels);
	if(result == CL_FALSE)
	{
		sampleCommon->error("signalLength > 2 ^ 23 not supported");
		return SDK_FAILURE;
	}

	/* Allocate and init memory used by host */
	inData = (cl_float*)malloc(signalLength * sizeof(cl_float));
	if(inData == NULL)
	{ 
		sampleCommon->error("Failed to allocate host memory. (inData)");
		return SDK_FAILURE;
	}

	for(unsigned int i = 0; i < signalLength; i++)
	{
		inData[i] = (cl_float)(rand() % 10);
	}

	dOutData = (cl_float*) malloc(signalLength * sizeof(cl_float));
	if(dOutData == NULL)
	{ 
		sampleCommon->error("Failed to allocate host memory. (dOutData)");
		return SDK_FAILURE;
	}
	memset(dOutData, 0, signalLength * sizeof(cl_float));

	dPartialOutData = (cl_float*) malloc(signalLength * sizeof(cl_float));
	if(dPartialOutData == NULL) 
	{ 
		sampleCommon->error("Failed to allocate host memory.(dPartialOutData)");
		return SDK_FAILURE;
	}
	memset(dPartialOutData, 0, signalLength * sizeof(cl_float));

	hOutData = (cl_float*)malloc(signalLength * sizeof(cl_float));
	if(hOutData == NULL)    
	{ 
		sampleCommon->error("Failed to allocate host memory. (hOutData)");
		return SDK_FAILURE;
	}
	memset(hOutData, 0, signalLength * sizeof(cl_float));

	if(!quiet)
	{
		sampleCommon->printArray<cl_float>("Input Signal", inData, signalLength, 1);
	}

	return SDK_SUCCESS;
}

	int 
DwtHaar1D::genBinaryImage()
{
	cl_int status = CL_SUCCESS;

	/*
	 * Have a look at the available platforms and pick either
	 * the AMD one if available or a reasonable default.
	 */
	cl_uint numPlatforms;
	cl_platform_id platform = NULL;
	status = clGetPlatformIDs(0, NULL, &numPlatforms);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clGetPlatformIDs failed."))
	{
		return SDK_FAILURE;
	}
	if (0 < numPlatforms) 
	{
		cl_platform_id* platforms = new cl_platform_id[numPlatforms];
		status = clGetPlatformIDs(numPlatforms, platforms, NULL);
		if(!sampleCommon->checkVal(status,
					CL_SUCCESS,
					"clGetPlatformIDs failed."))
		{
			return SDK_FAILURE;
		}

		char platformName[100];
		for (unsigned i = 0; i < numPlatforms; ++i) 
		{
			status = clGetPlatformInfo(platforms[i],
					CL_PLATFORM_VENDOR,
					sizeof(platformName),
					platformName,
					NULL);

			if(!sampleCommon->checkVal(status,
						CL_SUCCESS,
						"clGetPlatformInfo failed."))
			{
				return SDK_FAILURE;
			}

			platform = platforms[i];
			if (!strcmp(platformName, "Advanced Micro Devices, Inc.")) 
			{
				break;
			}
		}
		std::cout << "Platform found : " << platformName << "\n";
		delete[] platforms;
	}

	if(NULL == platform)
	{
		sampleCommon->error("NULL platform found so Exiting Application.");
		return SDK_FAILURE;
	}

	/*
	 * If we could find our platform, use it. Otherwise use just available platform.
	 */
	cl_context_properties cps[5] = 
	{
		CL_CONTEXT_PLATFORM, 
		(cl_context_properties)platform, 
		CL_CONTEXT_OFFLINE_DEVICES_AMD,
		(cl_context_properties)1,
		0
	};

	context = clCreateContextFromType(cps,
			CL_DEVICE_TYPE_ALL,
			NULL,
			NULL,
			&status);

	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clCreateContextFromType failed."))
	{
		return SDK_FAILURE;
	}

	/* create a CL program using the kernel source */
	streamsdk::SDKFile kernelFile;
	std::string kernelPath = sampleCommon->getPath();
	kernelPath.append("DwtHaar1D_Kernels.cl");
	if(!kernelFile.open(kernelPath.c_str()))
	{
		std::cout << "Failed to load kernel file : " << kernelPath << std::endl;
		return SDK_FAILURE;
	}
	const char * source = kernelFile.source().c_str();
	size_t sourceSize[] = {strlen(source)};
	program = clCreateProgramWithSource(context,
			1,
			&source,
			sourceSize,
			&status);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clCreateProgramWithSource failed."))
	{
		return SDK_FAILURE;
	}

	/* create a cl program executable for all the devices specified */
	status = clBuildProgram(program,
			0,
			NULL,
			NULL,
			NULL,
			NULL);

	size_t numDevices;
	status = clGetProgramInfo(program, 
			CL_PROGRAM_NUM_DEVICES,
			sizeof(numDevices),
			&numDevices,
			NULL );
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clGetProgramInfo(CL_PROGRAM_NUM_DEVICES) failed."))
	{
		return SDK_FAILURE;
	}

	std::cout << "Number of devices found : " << numDevices << "\n\n";
	devices = (cl_device_id *)malloc( sizeof(cl_device_id) * numDevices );
	if(devices == NULL)
	{
		sampleCommon->error("Failed to allocate host memory.(devices)");
		return SDK_FAILURE;
	}
	/* grab the handles to all of the devices in the program. */
	status = clGetProgramInfo(program, 
			CL_PROGRAM_DEVICES, 
			sizeof(cl_device_id) * numDevices,
			devices,
			NULL );
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clGetProgramInfo(CL_PROGRAM_DEVICES) failed."))
	{
		return SDK_FAILURE;
	}


	/* figure out the sizes of each of the binaries. */
	size_t *binarySizes = (size_t*)malloc( sizeof(size_t) * numDevices );
	if(devices == NULL)
	{
		sampleCommon->error("Failed to allocate host memory.(binarySizes)");
		return SDK_FAILURE;
	}

	status = clGetProgramInfo(program, 
			CL_PROGRAM_BINARY_SIZES,
			sizeof(size_t) * numDevices, 
			binarySizes, NULL);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clGetProgramInfo(CL_PROGRAM_BINARY_SIZES) failed."))
	{
		return SDK_FAILURE;
	}

	size_t i = 0;
	/* copy over all of the generated binaries. */
	char **binaries = (char **)malloc( sizeof(char *) * numDevices );
	if(binaries == NULL)
	{
		sampleCommon->error("Failed to allocate host memory.(binaries)");
		return SDK_FAILURE;
	}

	for(i = 0; i < numDevices; i++)
	{
		if(binarySizes[i] != 0)
		{
			binaries[i] = (char *)malloc( sizeof(char) * binarySizes[i]);
			if(binaries[i] == NULL)
			{
				sampleCommon->error("Failed to allocate host memory.(binaries[i])");
				return SDK_FAILURE;
			}
		}
		else
		{
			binaries[i] = NULL;
		}
	}
	status = clGetProgramInfo(program, 
			CL_PROGRAM_BINARIES,
			sizeof(char *) * numDevices, 
			binaries, 
			NULL);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clGetProgramInfo(CL_PROGRAM_BINARIES) failed."))
	{
		return SDK_FAILURE;
	}

	/* dump out each binary into its own separate file. */
	for(i = 0; i < numDevices; i++)
	{
		char fileName[100];
		sprintf(fileName, "%s.%d", dumpBinary.c_str(), (int)i);
		if(binarySizes[i] != 0)
		{
			char deviceName[1024];
			status = clGetDeviceInfo(devices[i], 
					CL_DEVICE_NAME, 
					sizeof(deviceName),
					deviceName, 
					NULL);
			if(!sampleCommon->checkVal(status,
						CL_SUCCESS,
						"clGetDeviceInfo(CL_DEVICE_NAME) failed."))
			{
				return SDK_FAILURE;
			}

			printf( "%s binary kernel: %s\n", deviceName, fileName);
			streamsdk::SDKFile BinaryFile;
			if(!BinaryFile.writeBinaryToFile(fileName, 
						binaries[i], 
						binarySizes[i]))
			{
				std::cout << "Failed to load kernel file : " << fileName << std::endl;
				return SDK_FAILURE;
			}
		}
		else
		{
			printf("Skipping %s since there is no binary data to write!\n",
					fileName);
		}
	}

	// Release all resouces and memory
	for(i = 0; i < numDevices; i++)
	{
		if(binaries[i] != NULL)
		{
			free(binaries[i]);
			binaries[i] = NULL;
		}
	}

	if(binaries != NULL)
	{
		free(binaries);
		binaries = NULL;
	}

	if(binarySizes != NULL)
	{
		free(binarySizes);
		binarySizes = NULL;
	}

	if(devices != NULL)
	{
		free(devices);
		devices = NULL;
	}

	status = clReleaseProgram(program);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clReleaseProgram failed."))
	{
		return SDK_FAILURE;
	}

	status = clReleaseContext(context);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clReleaseContext failed."))
	{
		return SDK_FAILURE;
	}

	return SDK_SUCCESS;
}


	int
DwtHaar1D::setupCL(void)
{
	cl_int status = 0;
	size_t deviceListSize;

	cl_device_type dType;

	if(deviceType.compare("cpu") == 0)
	{
		dType = CL_DEVICE_TYPE_CPU;
	}
	else //deviceType = "gpu" 
	{
		dType = CL_DEVICE_TYPE_GPU;
	}

	/*
	 * Have a look at the available platforms and pick either
	 * the AMD one if available or a reasonable default.
	 */

	cl_uint numPlatforms;
	cl_platform_id platform = NULL;
	status = clGetPlatformIDs(0, NULL, &numPlatforms);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clGetPlatformIDs failed."))
	{
		return SDK_FAILURE;
	}
	if (0 < numPlatforms) 
	{
		cl_platform_id* platforms = new cl_platform_id[numPlatforms];
		status = clGetPlatformIDs(numPlatforms, platforms, NULL);
		if(!sampleCommon->checkVal(status,
					CL_SUCCESS,
					"clGetPlatformIDs failed."))
		{
			return SDK_FAILURE;
		}
		for (unsigned i = 0; i < numPlatforms; ++i) 
		{
			char pbuf[100];
			status = clGetPlatformInfo(platforms[i],
					CL_PLATFORM_VENDOR,
					sizeof(pbuf),
					pbuf,
					NULL);

			if(!sampleCommon->checkVal(status,
						CL_SUCCESS,
						"clGetPlatformInfo failed."))
			{
				return SDK_FAILURE;
			}

			platform = platforms[i];
			if (!strcmp(pbuf, "Advanced Micro Devices, Inc.")) 
			{
				break;
			}
		}
		delete[] platforms;
	}

	if(NULL == platform)
	{
		sampleCommon->error("NULL platform found so Exiting Application.");
		return SDK_FAILURE;
	}

	// Display available devices.
	if(!sampleCommon->displayDevices(platform, dType))
	{
		sampleCommon->error("sampleCommon::displayDevices() failed");
		return SDK_FAILURE;
	}

	/*
	 * If we could find our platform, use it. Otherwise use just available platform.
	 */

	cl_context_properties cps[3] = 
	{
		CL_CONTEXT_PLATFORM, 
		(cl_context_properties)platform, 
		0
	};

	context = clCreateContextFromType(cps,
			dType,
			NULL,
			NULL,
			&status);

	if(!sampleCommon->checkVal(status, 
				CL_SUCCESS,
				"clCreateContextFromType failed."))
	{
		return SDK_FAILURE;
	}

	/* First, get the size of device list data */
	status = clGetContextInfo(context, 
			CL_CONTEXT_DEVICES, 
			0, 
			NULL, 
			&deviceListSize);

	if(!sampleCommon->checkVal(status, 
				CL_SUCCESS,
				"clGetContextInfo failed."))
	{
		return SDK_FAILURE;
	}

	int deviceCount = (int)(deviceListSize / sizeof(cl_device_id));
	if(!sampleCommon->validateDeviceId(deviceId, deviceCount))
	{
		sampleCommon->error("sampleCommon::validateDeviceId() failed");
		return SDK_FAILURE;
	}

	/* Now allocate memory for device list based on the size we got earlier */
	devices = (cl_device_id*)malloc(deviceListSize);
	if(devices == NULL)
	{
		sampleCommon->error("Failed to allocate memory (devices).");
		return SDK_FAILURE;
	}

	/* Now, get the device list data */
	status = clGetContextInfo(context, 
			CL_CONTEXT_DEVICES, 
			deviceListSize, 
			devices, 
			NULL);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS, 
				"clGetContextInfo failed."))
	{
		return SDK_FAILURE;
	}

	commandQueue = clCreateCommandQueue(context, 
			devices[deviceId], 
			0, 
			&status);
	if(!sampleCommon->checkVal(status,
				0,
				"clCreateCommandQueue failed."))
	{
		return SDK_FAILURE;
	}

	/* Get Device specific Information */
	status = clGetDeviceInfo(devices[deviceId],
			CL_DEVICE_MAX_WORK_GROUP_SIZE,
			sizeof(size_t),
			(void*)&maxWorkGroupSize,
			NULL);

	if(!sampleCommon->checkVal(status,
				CL_SUCCESS, 
				"clGetDeviceInfo"
				"CL_DEVICE_MAX_WORK_GROUP_SIZE failed."))
	{
		return SDK_FAILURE;
	}


	status = clGetDeviceInfo(devices[deviceId],
			CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS,
			sizeof(cl_uint),
			(void*)&maxDimensions,
			NULL);

	if(!sampleCommon->checkVal(status,
				CL_SUCCESS, 
				"clGetDeviceInfo"
				"CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS failed."))
	{
		return SDK_FAILURE;
	}


	maxWorkItemSizes = (size_t*)malloc(maxDimensions * sizeof(size_t));

	status = clGetDeviceInfo(devices[deviceId],
			CL_DEVICE_MAX_WORK_ITEM_SIZES,
			sizeof(size_t) * maxDimensions,
			(void*)maxWorkItemSizes,
			NULL);

	if(!sampleCommon->checkVal(status,
				CL_SUCCESS, 
				"clGetDeviceInfo"
				"CL_DEVICE_MAX_WORK_ITEM_SIZES failed."))
	{
		return SDK_FAILURE;
	}


	status = clGetDeviceInfo(devices[deviceId],
			CL_DEVICE_LOCAL_MEM_SIZE,
			sizeof(cl_ulong),
			(void *)&totalLocalMemory,
			NULL);

	if(!sampleCommon->checkVal(status,
				CL_SUCCESS, 
				"clGetDeviceInfo"
				"CL_DEVICE_LOCAL_MEM_SIZE failed."))
	{
		return SDK_FAILURE;
	}

	inDataBuf = clCreateBuffer(context,
			CL_MEM_READ_ONLY | CL_MEM_USE_HOST_PTR,
			sizeof(cl_float) * signalLength,
			inData,
			&status);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clCreateBuffer failed. (inDataBuf)"))
	{
		return SDK_FAILURE;

	}

	dOutDataBuf = clCreateBuffer(context, 
			CL_MEM_WRITE_ONLY,
			signalLength * sizeof(cl_float),
			NULL, 
			&status);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clCreateBuffer failed. (dOutDataBuf)"))
	{
		return SDK_FAILURE;
	}

	dPartialOutDataBuf = clCreateBuffer(context, 
			CL_MEM_WRITE_ONLY,
			signalLength * sizeof(cl_float),
			NULL, 
			&status);
	if(!sampleCommon->checkVal(status,
				CL_SUCCESS,
				"clCreateBuffer failed. (dPartialOutDataBuf)"))
	{
		return SDK_FAILURE;
	}

	/* create a CL program using the kernel source */
	streamsdk::SDKFile kernelFile;
	std::string kernelPath = sampleCommon->getPath();

	if(isLoadBinaryEnabled())
	{
		kernelPath.append(loadBinary.c_str());
		if(!kernelFile.readBinaryFromFile(kernelPath.c_str()))
		{
			std::cout << "Failed to load kernel file : " << kernelPath << std::endl;
			return SDK_FAILURE;
		}

		const char * binary = kernelFile.source().c_str();
		size_t binarySize = kernelFile.source().size();
		program = clCreateProgramWithBinary(context,
				1,
				&devices[deviceId], 
				(const size_t*)&binarySize,
				(const unsigned char**)&binary,
				NULL,
				&status);
	}
	else
	{
		kernelPath.append("DwtHaar1D_Kernels.cl");
		if(!kernelFile.open(kernelPath.c_str()))
		{
			std::cout << "Failed to load kernel file : " << kernelPath << std::endl;
			return SDK_FAILURE;
		}
		const char *source = kernelFile.source().c_str();
		size_t sourceSize[] = {strlen(source)};
		program = clCreateProgramWithSource(context,
				1,
				&source,
				sourceSize,
				&status);
	}
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clCreateProgramWithSource failed."))
		return SDK_FAILURE;

	/* create a cl program executable for all the devices specified */
	status = clBuildProgram(program, 1, &devices[deviceId], NULL, NULL, NULL);
	if(status != CL_SUCCESS)
	{
		if(status == CL_BUILD_PROGRAM_FAILURE)
		{
			cl_int logStatus;
			char * buildLog = NULL;
			size_t buildLogSize = 0;
			logStatus = clGetProgramBuildInfo (program, 
					devices[deviceId], 
					CL_PROGRAM_BUILD_LOG, 
					buildLogSize, 
					buildLog, 
					&buildLogSize);
			if(!sampleCommon->checkVal(
						logStatus,
						CL_SUCCESS,
						"clGetProgramBuildInfo failed."))
				return SDK_FAILURE;

			buildLog = (char*)malloc(buildLogSize);
			if(buildLog == NULL)
			{
				sampleCommon->error("Failed to allocate host memory." 
						"(buildLog)");
				return SDK_FAILURE;
			}
			memset(buildLog, 0, buildLogSize);

			logStatus = clGetProgramBuildInfo (program, 
					devices[deviceId], 
					CL_PROGRAM_BUILD_LOG, 
					buildLogSize, 
					buildLog, 
					NULL);
			if(!sampleCommon->checkVal(
						logStatus,
						CL_SUCCESS,
						"clGetProgramBuildInfo failed."))
			{
				free(buildLog);
				return SDK_FAILURE;
			}

			std::cout << " \n\t\t\tBUILD LOG\n";
			std::cout << " ************************************************\n";
			std::cout << buildLog << std::endl;
			std::cout << " ************************************************\n";
			free(buildLog);
		}

		if(!sampleCommon->checkVal(
					status,
					CL_SUCCESS,
					"clBuildProgram failed."))
			return SDK_FAILURE;
	}

	/* get a kernel object handle for a kernel with the given name */
	kernel = clCreateKernel(program, "dwtHaar1D", &status);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clCreateKernel failed."))
		return SDK_FAILURE;

	/* Get max work-group size supported on kernel */
	status = clGetKernelWorkGroupInfo(kernel,
			devices[deviceId],
			CL_KERNEL_WORK_GROUP_SIZE,
			sizeof(size_t),
			&kernelWorkGroupSize,
			0);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS, 
				"clGetKernelWorkGroupInfo CL_KERNEL_COMPILE_WORK_GROUP_SIZE failed."))
	{
		return SDK_FAILURE;
	}

	return SDK_SUCCESS;
}

int DwtHaar1D::runDwtHaar1DKernel()
{

	cl_int status;
	cl_event events[1];

	size_t globalThreads = curSignalLength >> 1;
	size_t localThreads = groupSize;

	if(localThreads > maxWorkItemSizes[0] || localThreads > maxWorkGroupSize)
	{
		std::cout << "Unsupported: Device does not support"
			"requested number of work items.";
		return SDK_FAILURE;
	}


	/* Force write to inData Buf to update its values */
	status = clEnqueueWriteBuffer(commandQueue,
			inDataBuf,
			1,
			0,
			curSignalLength * sizeof(cl_float),
			inData,
			0,0,0);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clEnqueueWriteBuffer failed. (inDataBuf)"))
		return SDK_FAILURE;

	status = clFinish(commandQueue);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clFinish failed. (commandQueue)"))
		return SDK_FAILURE;

	/* Whether sort is to be in increasing order. CL_TRUE implies increasing */
	status = clSetKernelArg(kernel, 
			0, 
			sizeof(cl_mem), 
			(void*)&inDataBuf); 
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clSetKernelArg failed. (inDataBuf)"))
		return SDK_FAILURE;
	printf("clSetKernelArg: inSignal = %p\n", inDataBuf);

	status = clSetKernelArg(kernel, 
			1, 
			sizeof(cl_mem), 
			(void*)&dOutDataBuf); 
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clSetKernelArg failed. (dOutDataBuf)"))
		return SDK_FAILURE;
	printf("clSetKernelArg: coefsSignal = %p\n", dOutDataBuf);

	status = clSetKernelArg(kernel, 
			2, 
			sizeof(cl_mem), 
			(void*)&dPartialOutDataBuf); 
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clSetKernelArg failed. (dPartialOutData)"))
		return SDK_FAILURE;
	printf("clSetKernelArg: AverageSignal = %p\n", dPartialOutDataBuf);

	status = clSetKernelArg(kernel, 
			3, 
			(localThreads * 2 * sizeof(cl_float)),
			NULL); 
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clSetKernelArg failed. (local memory)"))
		return SDK_FAILURE;
	printf("clSetKernelArg: SharedArray = NULL\n");

	status = clSetKernelArg(kernel, 
			4, 
			sizeof(cl_uint), 
			(void*)&totalLevels); 
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clSetKernelArg failed. (totalLevels)"))
		return SDK_FAILURE;
	printf("clSetKernelArg: tLevels = %d\n", totalLevels);

	status = clSetKernelArg(kernel, 
			5, 
			sizeof(cl_uint), 
			(void*)&curSignalLength); 
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clSetKernelArg failed. (curSignalLength)"))
		return SDK_FAILURE;
	printf("clSetKernelArg: signalLength = %d\n", curSignalLength);

	status = clSetKernelArg(kernel, 
			6, 
			sizeof(cl_uint), 
			(void*)&levelsDone); 
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clSetKernelArg failed. (levelsDone)"))
		return SDK_FAILURE;
	printf("clSetKernelArg: levelsDone = %d\n", levelsDone);

	status = clSetKernelArg(kernel, 
			7, 
			sizeof(cl_uint), 
			(void*)&maxLevelsOnDevice); 
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clSetKernelArg failed. (levelsDone)"))
		return SDK_FAILURE;
	printf("clSetKernelArg: mLevels = %d\n", maxLevelsOnDevice);

	status = clGetKernelWorkGroupInfo(kernel,
			devices[deviceId],
			CL_KERNEL_LOCAL_MEM_SIZE,
			sizeof(cl_ulong),
			&usedLocalMemory,
			NULL);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS, 
				"clGetKernelWorkGroupInfo CL_KERNEL_LOCAL_MEM_SIZE failed."))
	{
		return SDK_FAILURE;
	}

	if(usedLocalMemory > totalLocalMemory)
	{
		std::cout << "Unsupported: Insufficient local memory on device." << 
			std::endl;
		return SDK_FAILURE;
	}

	/* 
	 * Enqueue a kernel run call.
	 */
	status = clEnqueueNDRangeKernel(
			commandQueue,
			kernel,
			1,
			NULL,
			&globalThreads,
			&localThreads,
			0,
			NULL,
			&events[0]);

	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clEnqueueNDRangeKernel failed."))
		return SDK_FAILURE;


	/* wait for the kernel call to finish execution */
	status = clWaitForEvents(1, &events[0]);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clWaitForEvents failed."))
		return SDK_FAILURE;

	status = clReleaseEvent(events[0]);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clReleaseEvent failed."))
		return SDK_FAILURE;

	/* Enqueue the results to application pointer*/
	status = clEnqueueReadBuffer(
			commandQueue, 
			dOutDataBuf, 
			CL_TRUE,
			0,
			signalLength * sizeof(cl_float),
			dOutData,
			0,
			NULL,
			&events[0]);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clEnqueueReadBuffer failed."))
		return SDK_FAILURE;

	/* wait for the read buffer to finish execution */
	status = clWaitForEvents(1, &events[0]);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clWaitForEvents failed."))
		return SDK_FAILURE;

	status = clReleaseEvent(events[0]);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clReleaseEvent failed."))
		return SDK_FAILURE;

	/* Enqueue the results to application pointer*/
	status = clEnqueueReadBuffer(
			commandQueue, 
			dPartialOutDataBuf, 
			CL_TRUE,
			0,
			signalLength * sizeof(cl_float),
			dPartialOutData,
			0,
			NULL,
			&events[0]);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clEnqueueReadBuffer failed."))
		return SDK_FAILURE;

	/* wait for the read buffer to finish execution */
	status = clWaitForEvents(1, &events[0]);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clWaitForEvents failed."))
		return SDK_FAILURE;

	status = clReleaseEvent(events[0]);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clReleaseEvent failed."))
		return SDK_FAILURE;

	return SDK_SUCCESS;
}

	int 
DwtHaar1D::runCLKernels(void)
{

	/* Calculate thread-histograms */
	unsigned int levels = 0;
	unsigned int curLevels = 0;
	unsigned int actualLevels = 0;
	getLevels(signalLength, &levels);
	actualLevels = levels;

	//max levels on device should be decided by kernelWorkGroupSize
	int tempVar = (int)(log((float)kernelWorkGroupSize) / log((float)2));
	maxLevelsOnDevice = tempVar + 1;

	cl_float* temp = (cl_float*)malloc(signalLength * sizeof(cl_float));
	memcpy(temp, inData, signalLength * sizeof(cl_float));

	levelsDone = 0;
	int one = 1;
	while((unsigned int)levelsDone < actualLevels)
	{
		curLevels = (levels < maxLevelsOnDevice) ? levels : maxLevelsOnDevice;

		// Set the signal length for current iteration
		if(levelsDone == 0)
			curSignalLength = signalLength;
		else
			curSignalLength = (one << levels);

		// Set group size
		groupSize = (1 << curLevels) / 2;

		totalLevels = levels;
		runDwtHaar1DKernel();

		if(levels <= maxLevelsOnDevice)
		{
			dOutData[0] = dPartialOutData[0];
			memcpy(hOutData, dOutData, (one << curLevels) * sizeof(cl_float));
			memcpy(dOutData + (one << curLevels), hOutData + (one << curLevels), (signalLength  - (one << curLevels)) * sizeof(cl_float));
			break;
		}
		else
		{
			levels -= maxLevelsOnDevice;
			memcpy(hOutData, dOutData, curSignalLength * sizeof(cl_float));
			memcpy(inData, dPartialOutData, (one << levels) * sizeof(cl_float));
			levelsDone += (int)maxLevelsOnDevice;
		}

	}

	memcpy(inData, temp, signalLength * sizeof(cl_float));
	free(temp);
	return SDK_SUCCESS;
}

	int
DwtHaar1D::initialize()
{
	// Call base class Initialize to get default configuration
	if(!this->SDKSample::initialize())
		return SDK_FAILURE;

	streamsdk::Option* length_option = new streamsdk::Option;
	if(!length_option)
	{
		std::cout << "error. Failed to allocate memory (length_option)\n";
		return SDK_FAILURE;
	}

	length_option->_sVersion = "x";
	length_option->_lVersion = "signalLength";
	length_option->_description = "Length of the signal";
	length_option->_type = streamsdk::CA_ARG_INT;
	length_option->_value = &signalLength;

	sampleArgs->AddOption(length_option);
	delete length_option;

	streamsdk::Option* iteration_option = new streamsdk::Option;
	if(!iteration_option)
	{
		std::cout << "error. Failed to allocate memory (iteration_option)\n";
		return SDK_FAILURE;
	}

	iteration_option->_sVersion = "i";
	iteration_option->_lVersion = "iterations";
	iteration_option->_description = "Number of iterations for kernel execution";
	iteration_option->_type = streamsdk::CA_ARG_INT;
	iteration_option->_value = &iterations;

	sampleArgs->AddOption(iteration_option);
	delete iteration_option;

	return SDK_SUCCESS;
}

int DwtHaar1D::setup()
{
	if(setupDwtHaar1D() != SDK_SUCCESS)
		return SDK_FAILURE;

	int timer = sampleCommon->createTimer();
	sampleCommon->resetTimer(timer);
	sampleCommon->startTimer(timer);

	if(setupCL()!=SDK_SUCCESS)
		return SDK_FAILURE;

	sampleCommon->stopTimer(timer);
	/* Compute setup time */
	setupTime = (double)(sampleCommon->readTimer(timer));

	return SDK_SUCCESS;
}


int DwtHaar1D::run()
{
	int timer = sampleCommon->createTimer();
	sampleCommon->resetTimer(timer);
	sampleCommon->startTimer(timer);

	std::cout << "Executing kernel for " << 
		iterations << " iterations" << std::endl;
	std::cout << "-------------------------------------------" << std::endl;

	for(int i = 0; i < iterations; i++)
	{
		/* Arguments are set and execution call is enqueued on command buffer */
		if(runCLKernels() != SDK_SUCCESS)
			return SDK_FAILURE;
	}

	sampleCommon->stopTimer(timer);    
	/* Compute kernel time */
	kernelTime = (double)(sampleCommon->readTimer(timer)) / iterations;

	if(!quiet)
	{
		//memcpy(inData, dPartialOutData, (one << levels) * sizeof(cl_float));
		sampleCommon->printArray<cl_float>("dOutData", dPartialOutData, signalLength, 1);
	}

	return SDK_SUCCESS;
}


int DwtHaar1D::verifyResults()
{
	if(verify)
	{
		/* Rreference implementation on host device */
		calApproxFinalOnHost();


		/* Compare the results and see if they match */
		bool result = true;
		for(cl_uint i = 0; i < signalLength; ++i)
		{
			printf("element %d: dOutData[i]=%f, hOutData[i]=%f\n",
				i, dOutData[i], hOutData[i]);//////////
			if(fabs(dOutData[i] - hOutData[i]) > 0.1f)
			{
				result = false;
			}
		}

		if(result)
		{
			std::cout << "Passed!\n";
			return SDK_SUCCESS;
		}
		else
		{
			std::cout << "Failed\n";
			return SDK_FAILURE;
		}
	}

	return SDK_SUCCESS;
}

void DwtHaar1D::printStats()
{
	std::string strArray[3] = {"SignalLength", "Time(sec)", "kernelTime(sec)"};
	totalTime = setupTime + kernelTime;

	std::string stats[3];
	stats[0] = sampleCommon->toString(signalLength, std::dec);
	stats[1] = sampleCommon->toString(totalTime, std::dec);
	stats[2] = sampleCommon->toString(kernelTime, std::dec);

	this->SDKSample::printStats(strArray, stats, 3);
}


int DwtHaar1D::cleanup()
{
	/* Releases OpenCL resources (Context, Memory etc.) */
	cl_int status;

	status = clReleaseMemObject(inDataBuf);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clReleaseMemObject failed."))
		return SDK_FAILURE;

	status = clReleaseMemObject(dOutDataBuf);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clReleaseMemObject failed."))
		return SDK_FAILURE;

	status = clReleaseMemObject(dPartialOutDataBuf);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clReleaseMemObject failed."))
		return SDK_FAILURE;

	status = clReleaseKernel(kernel);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clReleaseKernel failed."))
		return SDK_FAILURE;

	status = clReleaseProgram(program);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clReleaseProgram failed."))
		return SDK_FAILURE;

	status = clReleaseCommandQueue(commandQueue);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clReleaseCommandQueue failed."))
		return SDK_FAILURE;

	status = clReleaseContext(context);
	if(!sampleCommon->checkVal(
				status,
				CL_SUCCESS,
				"clReleaseContext failed."))
		return SDK_FAILURE;

	/* Release program resources (input memory etc.) */
	if(inData) 
	{
		free(inData);
		inData = NULL;
	}

	if(dOutData) 
	{
		free(dOutData);
		dOutData = NULL;
	}

	if(dPartialOutData) 
	{
		free(dPartialOutData);
		dPartialOutData = NULL;
	}

	if(hOutData) 
	{
		free(hOutData);
		hOutData = NULL;
	}

	if(devices)
	{
		free(devices);
		devices = NULL;
	}

	if(maxWorkItemSizes)
	{
		free(maxWorkItemSizes);
		maxWorkItemSizes = NULL;
	}

	return SDK_SUCCESS;
}

	int 
main(int argc, char * argv[])
{
	/* Create MonteCalroAsian object */
	DwtHaar1D clDwtHaar1D("DwtHaar1D sample");

	/* Initialization */
	clDwtHaar1D.initialize();

	/* Parse command line options */
	if(!clDwtHaar1D.parseCommandLine(argc, argv))
		return SDK_FAILURE;

	if(clDwtHaar1D.isDumpBinaryEnabled())
	{
		return clDwtHaar1D.genBinaryImage();
	}
	else
	{
		/* Setup */
		if(clDwtHaar1D.setup()!=SDK_SUCCESS)
			return SDK_FAILURE;

		/* Run */
		if(clDwtHaar1D.run()!=SDK_SUCCESS)
			return SDK_FAILURE;

		/* Verify */
		if(clDwtHaar1D.verifyResults()!=SDK_SUCCESS)
			return SDK_FAILURE;

		/* Cleanup resources created */
		if(clDwtHaar1D.cleanup()!=SDK_SUCCESS)
			return SDK_FAILURE;

		/* Print performance statistics */
		clDwtHaar1D.printStats();
	}

	return SDK_SUCCESS;
}
