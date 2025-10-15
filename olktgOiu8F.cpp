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

	// Binding axis mappings
	InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
	InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
	InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

	// Binding action mappings
	InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
	InputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler::Fire);
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
		// Add camera look up input
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		// Add camera turn input
		AddControllerYawInput(Value);
	}
}

void APlayerInputHandler::Jump()
{
	// Handle jump action
	// You can add custom jump logic here
	bPressedJump = true;
}

void APlayerInputHandler::Fire()
{
	// Handle fire action
	// You can add custom fire logic here
	// For example, spawn a projectile or activate a weapon
}