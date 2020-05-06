% One-sample t-test for means
## Use case
We want to estimate the population mean with regard to a single, quantitave variable. We have a sample of size $n$ and popluation mean $\bar{x}$. We don't know with certainty the population standard deviation, $\sigma$, so we estimate it using the sample standard deviation, $s$.

## Preconditions
For this test to be reliable, one of the following conditions must hold:

1. The population is normally distributed.
2. The population is **roughly** normal, and our sample size is large.

## Hypotheses

**Null hypothesis, $H_0$:** $\mu = \mu_0$

**Alternative hypothesis, $H_a$:** $\mu \ne/>/< \mu_0$

## Test statistic
$$
	t = \frac{\bar{x} - \mu_0}{\frac{s}{\sqrt{n}}}
$$

## p-value
Where $T$ is a random variable distributed according to the $t(k)$ distribution with degrees of freedom $k = n-1$,

1. For $H_a : \mu < \mu_0$: $p = P(T \le t)$
2. For $H_a : \mu > \mu_0$: $p = P(T \ge t)$
3. For $H_a : \mu \ne \mu_0$: $p = 2P(T \le -|t|)$

Because the $t(k)$ distribution is slightly wider than the normal distribution, a p-value obtained using this method will be slightly larger than the p-value generated from a z-test.

## p-value (Python)
1. For $H_a : \mu < \mu_0$: `p = stats.t.cdf(t, df=n-1)`
2. For $H_a : \mu > \mu_0$: `p = 1 - stats.t.cdf(t, df=n-1)`
3. For $H_a : \mu \ne \mu_0$: `p = 2 * stats.t.cdf(-abs(t), df=n-1)`

## Associated confidence interval
$$
\text{C% confidence interval} = \bar{x} \pm t^\star \frac{s}{\sqrt{n}}\\
\text{choose } t^\star \text{ s.t. area on }t(n-1)\text{ distribution from }(-t^\star,t^\star)\text{ = C}
$$

Because our p-values are slightly larger than those from a z-test, our t-confidence interval will be slightly larger than a z-confidence interavl.

### Minimum sample size to achieve margin of error:
$$
	m^\star = t^\star \frac{s}{\sqrt{n}} \iff n = (\frac{t^\star s}{m^\star})^2
$$

## Related tests
If you have access to the true value of the population standard deviation, a [one-sample z-test for means](ztest.html) is more appropriate.

If you want to compare means across two diferent independent populations, a [two-sample t-test for means](twottest.html) is more appropriate.

## Considerations
A one-sample t-test conducted at confidence level $\alpha$ will reject the null hypothesis if and only if the value corresponding to the null hypothesis, $\mu_0$, is completely outside of the $C = 1-\alpha$ t-confidence interval.

The p-value provided from a one-sample t-test will always be *slightly* larger than a corresponding z-test. This larger p-value reflects the increased uncertainty introduced by estimating the population standard deviation using $s$.

### Conducting a matched pairs t-test
A matched pairs t-test is conducted where the variable of interest is actually the difference between two variables for a given pair. After computing this quantity for each case, proceed with a one-sample t-test for means on this single difference variable.
