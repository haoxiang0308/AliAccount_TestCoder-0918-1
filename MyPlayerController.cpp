#include "MyPlayerController.h"

AMyPlayerController::AMyPlayerController()
{
	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerController::BeginPlay()
{
	Super::BeginPlay();
	
}

void AMyPlayerController::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

void AMyPlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	check(InputComponent);

	// Bind axis inputs
	InputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);
	InputComponent->BindAxis("LookUp", this, &AMyPlayerController::LookUp);
	InputComponent->BindAxis("Turn", this, &AMyPlayerController::Turn);
}

void AMyPlayerController::MoveForward(float Value)
{
	// Add movement logic here
	if (Value != 0.0f)
	{
		// Example: Add movement input to the controlled pawn
		// APawn* const Pawn = GetPawn();
		// if (Pawn)
		// {
		// 	Pawn->AddMovementInput(GetActorForwardVector(), Value);
		// }
	}
}

void AMyPlayerController::MoveRight(float Value)
{
	// Add movement logic here
	if (Value != 0.0f)
	{
		// Example: Add movement input to the controlled pawn
		// APawn* const Pawn = GetPawn();
		// if (Pawn)
		// {
		// 	Pawn->AddMovementInput(GetActorRightVector(), Value);
		// }
	}
}

void AMyPlayerController::LookUp(float Value)
{
	// Add look up/down logic here
	if (Value != 0.0f)
	{
		// Example: Add controller input to the player controller
		// AddControllerPitchInput(Value);
	}
}

void AMyPlayerController::Turn(float Value)
{
	// Add turn logic here
	if (Value != 0.0f)
	{
		// Example: Add controller input to the player controller
		// AddControllerYawInput(Value);
	}
}