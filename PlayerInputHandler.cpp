#include "PlayerInputHandler.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
}

void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Set up gameplay key bindings
	check(InputComponent);

	// Movement
	InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);

	// Look
	InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
	InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

	// Actions
	InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
	InputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler::Fire);
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
		MoveForwardValue = Value;
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the right direction
		AddMovementInput(GetActorRightVector(), Value);
		MoveRightValue = Value;
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		// Add look up/down input
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		// Add turn input
		AddControllerYawInput(Value);
	}
}

void APlayerInputHandler::Jump()
{
	// Handle jump action
	// Example: if (CharacterMovement) CharacterMovement->DoJump(true);
}

void APlayerInputHandler::Fire()
{
	// Handle fire action
	// Example: Implement firing logic here
}