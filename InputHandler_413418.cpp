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

	// Bind movement actions
	if (InputComponent)
	{
		// Axis mappings
		InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
		InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
		InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

		// Action mappings
		InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
		InputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler::Fire);
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
		// Look up/down
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		// Turn left/right
		AddControllerYawInput(Value);
	}
}

void APlayerInputHandler::Jump()
{
	// Handle jump action
	if (CanJump())
	{
		Jump();
	}
}

void APlayerInputHandler::Fire()
{
	// Handle fire action
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::Red, TEXT("Firing!"));
	}
}