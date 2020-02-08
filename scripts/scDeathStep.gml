if (atmosup)
{
    if (atmosalpha < 0.5) atmosalpha += 0.001;
    else atmosup = 0;
}
else
{
    if (atmosalpha > 0.3) atmosalpha -= 0.001;
    else atmosup = 1;
}
