// Fill out your copyright notice in the Description page of Project Settings.


#include "WorkerSpawner.h"
#include "SpawnCheats.h"
#include "Misc/OutputDeviceNull.h"
#include "Util.h"

// Sets default values
AWorkerSpawner::AWorkerSpawner()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = false;
}

// Called when the game starts or when spawned
void AWorkerSpawner::BeginPlay()
{
	Super::BeginPlay();
	USpawnCheats::AddSpawner(this);
}

void AWorkerSpawner::BeginDestroy()
{
	USpawnCheats::RemoveSpawner(this);
	Super::BeginDestroy();
}

void AWorkerSpawner::SetActorHiddenInGame(bool newHidden)
{
	if (newHidden)
	{
		USpawnCheats::RemoveSpawner(this);
	}
	else
	{
		USpawnCheats::AddSpawner(this);
	}

	Super::SetActorHiddenInGame(newHidden);
}
