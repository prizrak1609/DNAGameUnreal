// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "ISpawner.h"
#include "WorkerSpawner.generated.h"

UCLASS()
class AWorkerSpawner : public AActor, public ISpawner
{
	GENERATED_BODY()
	
public:	
	// Sets default values for this actor's properties
	AWorkerSpawner();

	UFUNCTION(BlueprintImplementableEvent, Category = "Spawn")
	void Spawn();

	TYPE GetType();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

	virtual void BeginDestroy() override;

	virtual void SetActorHiddenInGame(bool newHidden) override;
};
