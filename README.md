# How do I code Physics and Math?

So you're studying a STEM field, and want to test your theory. What better place to start than a simulation?
That's what this repo is all about.

We'll essentially start learning how to use code to evaluate some mathematical expressions. We'll go first through some basic Math, and then try to apply the concepts to some Physics problems.

Many universities nowadays utilize MATLAB (or its open source counterpart, Octave); they both share most code capabilities. However, we'll also introduce Python code to solve the same problems.


## 1. Let's plot a sine wave


## 2. Do you know what a derivative is?
You might be thinking about a weird calculus limit. That's okay, but let's get the Physics angle. Supose a car's position is described as
```
x(t) = t^3
```
Why? Well, because not every movement is a Uniformly Varied.

How would you describe that car's velocity? This concept requires us to compare between two instants: the "now" -let's call it *t*, and the "future" -let's call it *t+dt*. Note that the "future" is the "now" plus some short interval. To calculate the velocity, we'll need to compute where the car will be in the future with respect to where it is now:
```
x(t+dt) - x(t)
```
We also want to calculate how long it took to get from the "now" to the "future", like this: "future"-"now"
```
(t+dt)-(t) = dt
```

Finally the velocity is calculated as follows:
```
v = [ x(t+dt) - x(t) ] / dt
```

You've seen this expression in every calculus book. We won't get into the math of it... but let's plot how it would look like, for differente values of *dt*



## 3. Analytic vs Numerical derivatives
So you learned that the derivative of x^2 is 2x. How is that of any use in Physics? Sometimes, when the system under study is sufficiently simple, you'll be able to evaluate the equations of motion. When the system is complex, the mathematical principles still hold, only you won't be able to evaluate them.
However magical, calculations made by software need you to define that *dt* -time differential, which mathematicians so mysteriously define.

Let's say we want to calculate the derivative of the function
```
f(t) = exp(-2t) * sin(10t - 6)
```

We might find that the analytical derivative is:
```
f'(t) = df /dt = -2 * exp(-2t) * sin(10t - 6) + 10 * exp(-2t) * cos(10t - 6)
```

Now let's find an expression for the numerical derivative. As it turns out, we already have one. That `df / dt` is telling us that we must evaluate a quotient of differences:
```
f'(t) = (approx) [ f(t+dt) - f(t) ] / dt
```

This becomes truer, the tinier *dt* gets -effectively arriving to the deffinition of a mathematical limit.

Let's plot both functions, the analytical derivative (we might call it the "true" derivative), and the numerical derivative (we'll call this one, the "approximate" derivative).
