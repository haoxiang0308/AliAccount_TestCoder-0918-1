#include "MyPlayerInputClass.h"

AMyPlayerInputClass::AMyPlayerInputClass()
{
	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerInputClass::BeginPlay()
{
	Super::BeginPlay();
	
}

void AMyPlayerInputClass::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

void AMyPlayerInputClass::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind input functions
	InputComponent->BindAxis("MoveForward", this, &AMyPlayerInputClass::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &AMyPlayerInputClass::MoveRight);
	InputComponent->BindAxis("LookUp", this, &AMyPlayerInputClass::LookUp);
	InputComponent->BindAxis("Turn", this, &AMyPlayerInputClass::Turn);
}

void AMyPlayerInputClass::MoveForward(float Value)
{
	MoveForwardValue = Value;
	// Add your movement logic here
}

void AMyPlayerInputClass::MoveRight(float Value)
{
	MoveRightValue = Value;
	// Add your movement logic here
}

void AyPlayerInputClass::LookUp(float Value)
{
	LookUpValue = Value;
	// Add your look up/down logic here
}

void AMyPlayerInputClass::Turn(float Value)
{
	TurnValue = Value;
	// Add your turn logic here
}