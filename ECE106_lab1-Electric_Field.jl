### A Pluto.jl notebook ###
# v0.12.19

using Markdown
using InteractiveUtils

# ╔═╡ a9d90294-61a6-11eb-1641-75e225e67315
begin
	using DataFrames
	using Plots
end

# ╔═╡ 61ca784e-5ceb-11eb-1423-5f9d48e72f26
md"# Lab 1 - Electric Field Visualization"

# ╔═╡ f4dbabba-61d4-11eb-1475-716ef6ea6109
md"
### Name: Omar Elrefaei

### ID: 20817426
### Date: 28/1/2021

"

# ╔═╡ f688a336-61a3-11eb-1f9d-754da19d57ac
md"
## Question 1

![](https://i.imgur.com/nPFMTWX.png)
"

# ╔═╡ 456010ee-619e-11eb-0b5d-c5b88755b425
begin
	dataQ1 = [
		8.81 7.35 4.54 2.76 0.4 ;
		18.3 13.2 6.36 3.04 0.19]
	dataFrameQ1 = DataFrame(
		var"Before -1nC" 	= dataQ1[1,:], 
		var"After -1nC"		= dataQ1[2,:])
end

# ╔═╡ c5c0813e-61a2-11eb-3a8d-09f01538c980
md"
##### Answer:

When a sensor is in between the two charges: the magnitude of E-field at that sensor increases. But if the sensor is on the left/right of both charges, the value decreases.

When a sensor is (horizontally) between the two opposite charges, they both induce an E-Field in the same direction, and thus increase the magnitude. When they are in the same direction from the sensor, they cancel out instead."

# ╔═╡ 30bcb2f4-61a4-11eb-3765-a365cf2665b5
md"
## Question 2

##### Answer:

The E-field for the first 4 sensors point horizontally to the right. The vertical components of the field have been cancelled out due to both charges being opposite to each other and lying at equal horizontal distance from the sensors. On the other hand, the horizontal components compound and add to each other.

"

# ╔═╡ 0fd26dd4-61a6-11eb-23bb-bf99cdd17325
md"
## Question 3

##### Answer:
The field strength increase linearly proportional to the distance between the
two charges.

"

# ╔═╡ 719bfbe0-61b3-11eb-19ab-d9fab0dff0f0
begin
	dataQ3 = [ 200	400	600	800	1000; 0.19 0.44 0.78 1.21 1.49]
	plot(dataQ3[1,:], dataQ3[2,:], title="Plot 1", label="Real Data", 
		lw=3, xlabel="Distance [m]", ylabel="E-field [V/m]")
	
	m = (dataQ3[2,end] - dataQ3[2,begin]) / (dataQ3[1,end] - dataQ3[1,begin])
	x = [i for i in 200:200:1000]
	y = -0.135 .+ x .* m
	plot!(x,y, label="Best fit", lw=2)
end

# ╔═╡ 06c52ba4-61bb-11eb-27a2-e9219195e2db
	dataFrameQ3 = DataFrame(var"Distance between charges" = dataQ3[1,:], 
	var"Feild at remote sensor" = dataQ3[2,:])

# ╔═╡ 613aceaa-61a6-11eb-3ebb-47d2098a108e
md"
## Question 4

##### Answer:
It doubles from `0.19 V/m` to `0.38 V/m`


"

# ╔═╡ 738a33da-61b9-11eb-360f-aff73553fd68
md"
## Question 5

##### Answer:

$
\begin{aligned} E \displaystyle \propto dq
\end{aligned}$

"

# ╔═╡ ab45850e-5cf0-11eb-09de-cdd1a970c6e5
md"## Question 6"

# ╔═╡ 148bb47a-5cea-11eb-2c24-b702525f32e5
md"![](https://i.imgur.com/JRmAd9P.png)"

# ╔═╡ f3deac54-619c-11eb-164d-3b50118d91c5
data = [
	50		100		150	200	250	300	350;
	25.6	5.09	1.71	0.82	0.44	0.27	0.17]

# ╔═╡ 0edcf9f8-5cf3-11eb-3c35-db30a5695de9
dataFrame = DataFrame(Distance = data[1,:], Magnitude= data[2,:])

# ╔═╡ bdd8daf4-5cf0-11eb-1f64-9149e5e74e12
begin
	distances = data[1,:]; magnitudes = data[2,:]
	plot(distances, magnitudes, title="Plot 1", label="Real Data", lw=3)
	line2 = [1/x^2 for x in 1:7]*25
	plot!(distances, line2 , label="1/x^2")
	
	line2 = [1/x^3 for x in 1:7]*25
	plot!(distances, line2, label="1/x^3")
	plot!(xlabel="Distance [m]", ylabel="E-field [V/m]")
	
end

# ╔═╡ 9bf1fd0c-5cf6-11eb-10c7-19216015602d
md"### Answer:
the value of `n` is going to be between `2` and `3` as seen in the graph.
"

# ╔═╡ 0369de5e-5cfd-11eb-2421-534f52fe3db1
md"## Question 7
### Answer:

$
\begin{aligned}E_{total}=E_{1}+E_{2}=\dfrac{kq}{\left(r+d\right) ^{2}}-\dfrac{kq}{r^{2}}=\\
=\dfrac{kq}{\left( r+d\right) ^{2}}-\dfrac{kq}{r^{2}}=kq\left( \dfrac{r^{2}-\left( r+d\right) ^{2}}{r^{2}\left( r+d\right) ^{2}}\right) \\ =kq\left( \dfrac{r^{2}-r^{2}-2rd-d^{2}}{r^{2}\left( r+d\right) ^{2}}\right) \\ =kq\left( -d\right) \left( \dfrac{2r+d}{r^{2}\left( r+1\right) ^{2}}\right)\\


\begin{aligned}\because r >>d \ ; \ \therefore E_{tota1}\approx kq\left( \dfrac{-d}{r^{3}}\right)\end{aligned}\approx 0

\end{aligned}$


The equation matches confirms the observation in the graph. As the r increases, the field strength decays exponentially.
"

# ╔═╡ ad446368-5d20-11eb-3cad-c72fd941d953
md"
## Question 8

No, the observation would not change with a change of polarity

## Question 9
![](https://i.imgur.com/DvrqFgI.png)
The charge Q is in an **unstable equilibrium**, because at far away distance, when nudged there is no (neglegible) restoring force.

## Question 10
![](https://i.imgur.com/0CkOshH.png)
The charge Q is in an **unstable equilibrium**, because any small nudge vertically will throw it away. Interestingly, if charges were -ve, Q is stable vertically but unstable horizontally.

## Question 11
![](https://i.imgur.com/vHrfXYp.jpg)
The charge Q is in an **unstable equilibrium**, because any small nudge horizontally will throw it away.

## Question 12
![](https://i.imgur.com/YGXZ1C4.png)
The charge Q is in an **unstable equilibrium**, because any small nudge horizontally will throw it away. Again, one direction is stable with one polarity, and switches with the polarity changes.


"

# ╔═╡ Cell order:
# ╟─61ca784e-5ceb-11eb-1423-5f9d48e72f26
# ╟─a9d90294-61a6-11eb-1641-75e225e67315
# ╟─f4dbabba-61d4-11eb-1475-716ef6ea6109
# ╟─f688a336-61a3-11eb-1f9d-754da19d57ac
# ╟─456010ee-619e-11eb-0b5d-c5b88755b425
# ╟─c5c0813e-61a2-11eb-3a8d-09f01538c980
# ╟─30bcb2f4-61a4-11eb-3765-a365cf2665b5
# ╟─0fd26dd4-61a6-11eb-23bb-bf99cdd17325
# ╟─06c52ba4-61bb-11eb-27a2-e9219195e2db
# ╟─719bfbe0-61b3-11eb-19ab-d9fab0dff0f0
# ╟─613aceaa-61a6-11eb-3ebb-47d2098a108e
# ╟─738a33da-61b9-11eb-360f-aff73553fd68
# ╟─ab45850e-5cf0-11eb-09de-cdd1a970c6e5
# ╟─148bb47a-5cea-11eb-2c24-b702525f32e5
# ╟─f3deac54-619c-11eb-164d-3b50118d91c5
# ╟─0edcf9f8-5cf3-11eb-3c35-db30a5695de9
# ╟─bdd8daf4-5cf0-11eb-1f64-9149e5e74e12
# ╟─9bf1fd0c-5cf6-11eb-10c7-19216015602d
# ╟─0369de5e-5cfd-11eb-2421-534f52fe3db1
# ╟─ad446368-5d20-11eb-3cad-c72fd941d953
