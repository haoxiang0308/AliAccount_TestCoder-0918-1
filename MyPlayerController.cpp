// Copyright Epic Games, Inc. All Rights Reserved.

#include "MyPlayerController.h"
#include "Engine/World.h"


void AMyPlayerController::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Bind input axis
    InputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
    InputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);

    // Bind input action
    InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
    InputComponent->BindAction("Jump", IE_Released, this, &AMyPlayerController::StopJumping);
}

void AMyPlayerController::MoveForward(float Value)
{
    if (Value != 0.0f)
    {
        // Add forward movement logic here
        AddMovementInput(GetActorForwardVector(), Value);
    }
}

void AMyPlayerController::MoveRight(float Value)
{
    if (Value != 0.0f)
    {
        // Add right movement logic here
        AddMovementInput(GetActorRightVector(), Value);
    }
}

void AMyPlayerController::Jump()
{
    // Add jump start logic here
    bPressedJump = true;
}

void AMyPlayerController::StopJumping()
{
    // Add jump stop logic here
    bPressedJump = false;
}