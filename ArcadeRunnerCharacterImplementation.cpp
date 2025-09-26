// Implementation file for AArcadeRunnerCharacter

#include "ArcadeRunnerCharacter.h"
#include "GameFramework/SpringArmComponent.h"
#include "Camera/CameraComponent.h"
#include "Components/InputComponent.h"

// Sets default values
AArcadeRunnerCharacter::AArcadeRunnerCharacter()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}

// Called when the game starts or when spawned
void AArcadeRunnerCharacter::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void AArcadeRunnerCharacter::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

	// Add movement in the direction the player is currently facing
	AddMovementInput(GetActorForwardVector(), MovementInputVector.X);
	AddMovementInput(GetActorRightVector(), MovementInputVector.Y);

}

// Called to bind functionality to input
void AArcadeRunnerCharacter::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind axis mappings
	PlayerInputComponent->BindAxis("MoveForward", this, &AArcadeRunnerCharacter::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &AArcadeRunnerCharacter::MoveRight);

	// Bind action mappings
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &AArcadeRunnerCharacter::Jump);

}

void AArcadeRunnerCharacter::MoveForward(float Value)
{
	// Update the forward/backward movement component of our input vector
	MovementInputVector.X = Value;
}

void AArcadeRunnerCharacter::MoveRight(float Value)
{
	// Update the right/left movement component of our input vector
	MovementInputVector.Y = Value;
}

void AArcadeRunnerCharacter::Jump()
{
	// Call the parent class's jump function
	Super::Jump();
}