// Fill out your copyright notice in the Description page of Project Settings.


#include "CameraPlayer.h"
#include "Components/InputComponent.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputMappingContext.h"
#include "GameFramework/PlayerInput.h"

// Sets default values
ACameraPlayer::ACameraPlayer()
{
	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = false;
}

// Called when the game starts or when spawned
void ACameraPlayer::BeginPlay()
{
	Super::BeginPlay();
}

// Called to bind functionality to input
void ACameraPlayer::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	APlayerController* PC = Cast<APlayerController>(GetController());

	// Get the local player subsystem
	UEnhancedInputLocalPlayerSubsystem* Subsystem = PC->GetLocalPlayer()->GetSubsystem<UEnhancedInputLocalPlayerSubsystem>();
	// Clear out existing mapping, and add our mapping
	Subsystem->ClearAllMappings();
	Subsystem->AddMappingContext(inputMapping_, 0);

	UEnhancedInputComponent* input = Cast<UEnhancedInputComponent>(PlayerInputComponent);
	input->BindAction(input_actions_->move_, ETriggerEvent::Triggered, this, &ACameraPlayer::move);
}

void ACameraPlayer::move(const FInputActionInstance& Value)
{
	FVector2D move_vector = Value.GetValue().Get<FVector2D>();
	
	if (move_vector.X > 0)
	{
		GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("Right"));
		AddMovementInput(FVector::RightVector, move_vector.X);
	}
	else
	{
	GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("Left"));
		AddMovementInput(FVector::LeftVector, move_vector.X);
	}

	if (move_vector.Y > 0)
	{
		GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("UP"));
		AddMovementInput(FVector::UpVector, move_vector.Y);
	}
	else
	{
		GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("Down"));
		AddMovementInput(FVector::DownVector, move_vector.Y);
	}
}
