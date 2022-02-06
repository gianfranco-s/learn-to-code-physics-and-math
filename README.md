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

First, let's plot the position:
