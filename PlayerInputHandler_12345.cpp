// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputComponent.h"
#include "Components/InputComponent.h"
#include "GameFramework/Character.h"
#include "GameFramework/PlayerController.h"
#include "Engine/World.h"


// Sets default values for this component's properties
UPlayerInputComponent::UPlayerInputComponent()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.  You can turn these features
	// off to improve performance if you don't need them.
	PrimaryComponentTick.bCanEverTick = true;

	// ...
}


// Called when the game starts
void UPlayerInputComponent::BeginPlay()
{
	Super::BeginPlay();

	// ...
	
}


// Called every frame
void UPlayerInputComponent::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// ...
}

void UPlayerInputComponent::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	// Binding example for a simple "Move Forward" action
	if (UInputComponent* InputComponent = Cast<UInputComponent>(PlayerInputComponent))
	{
		InputComponent->BindAxis("MoveForward", this, &UPlayerInputComponent::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &UPlayerInputComponent::MoveRight);
		InputComponent->BindAction("Jump", IE_Pressed, this, &UPlayerInputComponent::Jump);
		InputComponent->BindAction("Jump", IE_Released, this, &UPlayerInputComponent::StopJumping);
	}
}

void UPlayerInputComponent::MoveForward(float Value)
{
	if (ACharacter* Character = Cast<ACharacter>(GetOwner()))
	{
		Character->AddMovementInput(Character->GetActorForwardVector(), Value);
	}
}

void UPlayerInputComponent::MoveRight(float Value)
{
	if (ACharacter* Character = Cast<ACharacter>(GetOwner()))
	{
		Character->AddMovementInput(Character->GetActorRightVector(), Value);
	}
}

void UPlayerInputComponent::Jump()
{
	if (ACharacter* Character = Cast<ACharacter>(GetOwner()))
	{
		Character->Jump();
	}
}

void UPlayerInputComponent::StopJumping()
{
	if (ACharacter* Character = Cast<ACharacter>(GetOwner()))
	{
		Character->StopJumping();
	}
}