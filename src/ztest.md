% One-sample z-test for means
## Use case
We want to estimate the population mean with regard to a single, quantitave variable. We know with certainty the population standard deviation, $\sigma$. We have a sample of size $n$ and popluation mean $\bar{x}$.

## Preconditions
To estimate the population mean using the normal distribution, one of the following conditions must hold:

1. The population is normally distributed.
2. The sample size, $n$, is large enough for the Central Limit Theorem to take effect.

## Hypotheses

**Null hypothesis, $H_0$:** $\mu = \mu_0$

**Alternative hypothesis, $H_a$:** $\mu \ne/>/< \mu_0$

## Test statistic
$$
	z = \frac{\bar{x} - \mu_0}{\frac{\sigma}{\sqrt{n}}}
$$

## p-value
Where Z is a standard normal random variable,

1. For $H_a : \mu < \mu_0$: $p = P(Z \le z)$
2. For $H_a : \mu > \mu_0$: $p = P(Z \ge z)$
3. For $H_a : \mu \ne \mu_0$: $p = 2P(Z \le -|z|)$

## p-value (Python)
1. For $H_a : \mu < \mu_0$: `p = stats.norm.cdf(z)`
2. For $H_a : \mu > \mu_0$: `p = 1 - stats.norm.cdf(z)`
3. For $H_a : \mu \ne \mu_0$: `p = 2 * stats.norm.cdf(-abs(z))`

## Associated confidence interval
$$
\text{C% confidence interval} = \bar{x} \pm z^\star \frac{\sigma}{\sqrt{n}}\\
\text{choose } z^\star \text{ s.t. area on standard normal distribution from }(-z^\star,z^\star)\text{ = C}
$$

### Minimum sample size to achieve margin of error:
$$
	m^\star = z^\star \frac{\sigma}{\sqrt{n}} \iff n = (\frac{z^\star \sigma}{m^\star})^2
$$

## Related tests
If you lack access to the true value of the population standard deviation, a [one-sample t-test for means](ttest.html) is more appropriate.

If you want to compare means across two diferent independent populations, a [two-sample z-test for means](twoztest.html) is more appropriate.

## Considerations
A one-sample z-test conducted at confidence level $\alpha$ will reject the null hypothesis if and only if the value corresponding to the null hypothesis, $\mu_0$, is completely outside of the $C = 1-\alpha$ confidence interval.
