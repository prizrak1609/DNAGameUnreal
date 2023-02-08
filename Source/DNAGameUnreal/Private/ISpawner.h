// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "UObject/Interface.h"
#include "WorkerSpawnType.h"
#include "ISpawner.generated.h"

// This class does not need to be modified.
UINTERFACE(MinimalAPI)
class USpawner : public UInterface
{
	GENERATED_BODY()
};

/**
 * 
 */
class ISpawner
{
	GENERATED_BODY()

	// Add interface functions to this class. This is the class that will be inherited to implement this interface.
public:

	virtual void Spawn() = 0;

	virtual EWorkerType GetType();

	virtual void SetType(EWorkerType type);

protected:
	EWorkerType spawnType;
};
