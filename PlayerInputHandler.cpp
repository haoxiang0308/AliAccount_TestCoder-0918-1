// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputHandler.h"
#include "Engine/Engine.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Enable touch-based movement
	// EnableTouchscreenMovement(PlayerInputComponent);

	// Bind action mappings
	if (InputComponent)
	{
		// Movement
		InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);

		// Look
		InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
		InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

		// Actions
		InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
		InputComponent->BindAction("Shoot", IE_Pressed, this, &APlayerInputHandler::Shoot);
	}
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the right direction
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		// Look up/down based on the value
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		// Turn left/right based on the value
		AddControllerYawInput(Value);
	}
}

void APlayerInputHandler::Jump()
{
	// Handle jump action
	if (CanJump())
	{
		// Simulate jumping
		UE_LOG(LogTemp, Log, TEXT("Player jumped!"));
	}
}

void APlayerInputHandler::Shoot()
{
	// Handle shoot action
	UE_LOG(LogTemp, Log, TEXT("Player shot!"));
}