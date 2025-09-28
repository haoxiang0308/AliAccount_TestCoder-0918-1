#include "MyPlayerController.h"

AMyPlayerController::AMyPlayerController()
{
	// Enable ticking for this controller
	PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind axis mappings
	InputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);
	InputComponent->BindAxis("LookUp", this, &AMyPlayerController::LookUp);
	InputComponent->BindAxis("Turn", this, &AMyPlayerController::Turn);
}

void AMyPlayerController::BeginPlay()
{
	Super::BeginPlay();
	// Initialization logic can go here
}

void AMyPlayerController::MoveForward(float Value)
{
	MoveForwardInput = Value;
	// Add movement logic here
}

void AMyPlayerController::MoveRight(float Value)
{
	MoveRightInput = Value;
	// Add movement logic here
}

void AMyPlayerController::LookUp(float Value)
{
	// Add look up/down logic here
}

void AMyPlayerController::Turn(float Value)
{
	// Add turn logic here
}