// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputHandler_98765.h"
#include "Engine/World.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"

// Sets default values
APlayerInputHandler_98765::APlayerInputHandler_98765()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler_98765::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void APlayerInputHandler_98765::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void APlayerInputHandler_98765::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);
	check(PlayerInputComponent);

	// Bind movement
	PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler_98765::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler_98765::MoveRight);

	// Bind actions
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &ACharacter::Jump);
	PlayerInputComponent->BindAction("Jump", IE_Released, this, &ACharacter::StopJumping);
}

void APlayerInputHandler_98765::MoveForward(float Value)
{
	if (Controller != nullptr && Value != 0.0f)
	{
		// Find out which way is forward
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get forward vector
		const FVector ForwardDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);

		// Add movement in that direction
		AddMovementInput(ForwardDirection, Value);
	}
}

void APlayerInputHandler_98765::MoveRight(float Value)
{
	if (Controller != nullptr && Value != 0.0f)
	{
		// Find out which way is right
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get right vector 
		const FVector RightDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);

		// Add movement in that direction
		AddMovementInput(RightDirection, Value);
	}
}