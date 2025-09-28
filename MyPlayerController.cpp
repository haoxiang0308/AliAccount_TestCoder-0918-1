// Copyright [Year] [Your Name]. All Rights Reserved.

#include "MyPlayerController.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

AMyPlayerController::AMyPlayerController()
{
	// Enable ticking for this component
	PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerController::BeginPlay()
{
	Super::BeginPlay();

	// Get the Enhanced Input Subsystem
	if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer()))
	{
		// Add the mapping context so the input component can read it
		Subsystem->AddMappingContext(InputMappingContext, 0);
	}
}

void AMyPlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Cast the Input Component to the Enhanced Input Component
	UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent);
	if (EnhancedInputComponent)
	{
		// Bind the actions
		EnhancedInputComponent->BindAction(MoveAction, ETriggerEvent::Triggered, this, &AMyPlayerController::Move);
		EnhancedInputComponent->BindAction(LookAction, ETriggerEvent::Triggered, this, &AMyPlayerController::Look);
		EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &AMyPlayerController::Jump);
		EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Completed, this, &AMyPlayerController::StopJump);
	}
}

void AMyPlayerController::Move(const FInputActionValue& Value)
{
	// Input is a Vector2D
	FVector2D MovementVector = Value.Get<FVector2D>();

	// Add movement to the player character
	if (APawn* ControlledPawn = GetPawn())
	{
		ControlledPawn->AddMovementInput(GetPawn()->GetActorForwardVector(), MovementVector.Y);
		ControlledPawn->AddMovementInput(GetPawn()->GetActorRightVector(), MovementVector.X);
	}
}

void AMyPlayerController::Look(const FInputActionValue& Value)
{
	// Input is a Vector2D
	FVector2D LookAxisVector = Value.Get<FVector2D>();

	if (APawn* ControlledPawn = GetPawn())
	{
		ControlledPawn->AddControllerYawInput(LookAxisVector.X);
		ControlledPawn->AddControllerPitchInput(LookAxisVector.Y);
	}
}

void AMyPlayerController::Jump()
{
	// Handle jump started
	if (APawn* ControlledPawn = GetPawn())
	{
		ControlledPawn->Jump();
	}
}

void AMyPlayerController::StopJump()
{
	// Handle jump stopped
	if (APawn* ControlledPawn = GetPawn())
	{
		ControlledPawn->StopJumping();
	}
}