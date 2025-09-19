// OgBPJOYaWyOO.cpp
// Player input handler class for Unreal Engine

#include "OgBPJOYaWyOO.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/PlayerController.h"
#include "Engine/World.h"

// Sets default values
AOgBPJOYaWyOO::AOgBPJOYaWyOO()
{
 	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}

// Called when the game starts or when spawned
void AOgBPJOYaWyOO::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void AOgBPJOYaWyOO::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void AOgBPJOYaWyOO::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Binding input actions
	PlayerInputComponent->BindAxis("MoveForward", this, &AOgBPJOYaWyOO::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &AOgBPJOYaWyOO::MoveRight);
	
	PlayerInputComponent->BindAxis("Turn", this, &AOgBPJOYaWyOO::AddControllerYawInput);
	PlayerInputComponent->BindAxis("LookUp", this, &AOgBPJOYaWyOO::AddControllerPitchInput);
	
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &AOgBPJOYaWyOO::StartJump);
	PlayerInputComponent->BindAction("Jump", IE_Released, this, &AOgBPJOYaWyOO::StopJump);
}

void AOgBPJOYaWyOO::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void AOgBPJOYaWyOO::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the right direction
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void AOgBPJOYaWyOO::StartJump()
{
	bPressedJump = true;
}

void AOgBPJOYaWyOO::StopJump()
{
	bPressedJump = false;
}