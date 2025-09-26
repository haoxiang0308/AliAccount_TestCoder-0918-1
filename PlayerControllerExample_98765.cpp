// PlayerControllerExample.cpp
#include "PlayerControllerExample.h"
#include "Engine/Engine.h"

APlayerControllerExample::APlayerControllerExample()
{
	// Enable ticking
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerControllerExample::BeginPlay()
{
	Super::BeginPlay();
	
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Red, TEXT("BeginPlay called for PlayerControllerExample!"));
	}
}

void APlayerControllerExample::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

void APlayerControllerExample::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind action events
	if (InputComponent)
	{
		InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerControllerExample::Jump);
		InputComponent->BindAction("Jump", IE_Released, this, &APlayerControllerExample::StopJumping);

		// Bind axis events
		InputComponent->BindAxis("MoveForward", this, &APlayerControllerExample::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &APlayerControllerExample::MoveRight);
	}
}

void APlayerControllerExample::Jump()
{
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 3.0f, FColor::Green, TEXT("Jump Pressed!"));
		// Add jump logic here
	}
}

void APlayerControllerExample::StopJumping()
{
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Yellow, TEXT("Jump Released!"));
		// Add stop jump logic here
	}
}

void APlayerControllerExample::MoveForward(float Value)
{
	if (GEngine && Value != 0.0f)
	{
		GEngine->AddOnScreenDebugMessage(-1, 0.1f, FColor::Cyan, FString::Printf(TEXT("Moving Forward/Backward: %f"), Value));
		// Add forward/backward movement logic here
	}
}

void APlayerControllerExample::MoveRight(float Value)
{
	if (GEngine && Value != 0.0f)
	{
		GEngine->AddOnScreenDebugMessage(-1, 0.1f, FColor::Magenta, FString::Printf(TEXT("Moving Right/Left: %f"), Value));
		// Add right/left movement logic here
	}
}