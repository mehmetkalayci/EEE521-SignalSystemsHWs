clc;
close all;
clear all;

a = 1/2; % alpha
b = 3/5; % beta

sonucIT = calcDoseAmountIteratively(200, a, b);

sonucRC = calcDoseAmountRecursively(200, a, b);