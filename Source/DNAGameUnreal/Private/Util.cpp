// Fill out your copyright notice in the Description page of Project Settings.

#include "Util.h"
#include "Engine.h"

void Util::PrintLog(FString text)
{
	static uint64 key = 0;
	key++;
	GEngine->AddOnScreenDebugMessage(key, 2.f, FColor::Green, text, true, FVector2D(1, 1));
}
