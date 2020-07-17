## JuliaTutorial

JuliaTutorial

### Prerequisites

Download the Julia executable from your the Julia official website(https://julialang.org/downloads/).

We will use jupyter notebooks for some of the demonstrations. So make sure to download anaconda.

### Setting up IJulia

Launch `julia` either from command line or by launching the executable, and perform following commands.

```julia

>julia using Pkg

>julia Pkg.add("IJulia")

>julia Pkg.build("IJulia")
```

### Instantiate the package

Now, we need to download other necessary dependencies. Julia makes this process pretty easy. Navigate to `CMTJulia` directory, and launch `julia` from there.

```julia

>julia using Pkg

>julia Pkg.activate("./")

>julia Pkg.instantiate("./")
```

This should start the installation process. Once you are done, you are ready to start exploring the notebooks!

### Parallelism

In order to explore thread based parallelism, we need to launch `julia` in multi-thread mode (https://docs.julialang.org/en/v1.0/manual/parallel-computing/#Multi-Threading-(Experimental)-1). If you are using Linux or MacOS, launch the terminal and do

`export JULIA_NUM_THREADS=100`

and then launch julia as usual. Once in julia session, run `Threads.nthreads()`. This should print a number larger than 1 if your hardware supports multithreading.

In order to quickly test multithreading, do the following to compare the speed of serial and parallel version of `myupdate` function in `src/JuliaTutorial`.

```julia
>julia using Pkg

>julia Pkg.activate("./")

>julia using JuliaTutorial

>julia y = rand(1_000_000); x = rand(1_000_000);

>julia myupdate!(y, x); myparallelupdate!(y, x); # run them once to initiate compilaoin

>julia @time myupdate!(y, x)

>julia @tme myparallelupdate!(y, x)
```

Try making the size of `y` and `x` bigger to see the power of parallelization!