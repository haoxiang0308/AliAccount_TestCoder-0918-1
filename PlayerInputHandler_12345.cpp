// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputHandler_12345.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"


void APlayerInputHandler_12345::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Get the Enhanced Input Component
	UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(PlayerInputComponent);
	if (!EnhancedInputComponent) return;

	// Bind actions
	EnhancedInputComponent->BindAction(MoveAction, ETriggerEvent::Triggered, this, &APlayerInputHandler_12345::Move);
	EnhancedInputComponent->BindAction(LookAction, ETriggerEvent::Triggered, this, &APlayerInputHandler_12345::Look);
}

void APlayerInputHandler_12345::Move(const FInputActionValue& Value)
{
	// Get the input vector and apply movement
	FVector2D MovementVector = Value.Get<FVector2D>();
	// Add movement logic here
}

void APlayerInputHandler_12345::Look(const FInputActionValue& Value)
{
	// Get the input vector and apply camera look
	FVector2D LookVector = Value.Get<FVector2D>();
	// Add look logic here
}