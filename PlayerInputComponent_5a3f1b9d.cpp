// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputComponent_5a3f1b9d.h"
#include "Engine/Engine.h"

// Sets default values for this component's properties
UPlayerInputComponent_5a3f1b9d::UPlayerInputComponent_5a3f1b9d()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.  You can turn these features
	// off to improve performance if you don't need them.
	PrimaryComponentTick.bCanEverTick = true;

	// ...
}


// Called when the game starts
void UPlayerInputComponent_5a3f1b9d::BeginPlay()
{
	Super::BeginPlay();

	// ...
	
}


// Called every frame
void UPlayerInputComponent_5a3f1b9d::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// ...
}