// Fill out your copyright notice in the Description page of Project Settings.


#include "ISpawner.h"

// Add default functionality here for any ISpawner functions that are not pure virtual.

EWorkerType ISpawner::GetType()
{
	return spawnType;
}

void ISpawner::SetType(EWorkerType type)
{
	spawnType = type;
}
