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



## 3. Analytic vs Numerical vs Symbolic derivatives
So you learned that the derivative of x^2 is 2x. How is that of any use in Physics? Sometimes, when the system under study is sufficiently simple, you'll be able to evaluate the equations of motion. When the system is complex, the mathematical principles still hold, only you won't be able to evaluate them.

However magical, calculations made by software need you to define that *dt* -time differential, which mathematicians so mysteriously allude.

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

**But what about symbolic derivatives?** you might be asking your self. We're getting there.

They correspond to a method of computing derivatives by telling the software the rules it needs to find the final result. What the software would then effectively do, is find `f'(t)`. As we said earlier, this works for simple systems, just like the analytic method.

To sum up, we have the
* TRUE derivative, given to us by Calculus.
* APPROXIMATE derivative, calculated over some discrete interval `dt`
* SYMBOLIC derivative, which should be exactly the same as the TRUE derivative. The only difference would lie in that **we don't have to calculate it**

So, let's plot these three functions. We'll use a *tru_time* array, to plot the continuous time derivative (the TRUE one), and a *dsc_time* array to plot the other two.

[PLOTS GO HERE]

Note that the yellow dots **always** fall over the true derivative, while the red circles *converge* to it.