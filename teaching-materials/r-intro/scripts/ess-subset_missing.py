import pandas as pd
import numpy as np
import os

savepath = os.path.join('..', 'datasets', 'ESS2018DK_subset.csv')
df = pd.read_csv(savepath)

df['ppltrst'] = df['ppltrst'].replace({'Most people can be trusted': 10, 'You can\'t be too careful': 0, 'Don\'t know': np.nan})
df = df.replace({'Not applicable': np.nan, 'No answer': np.nan, 'Refusal': np.nan, 'Don\'t know': np.nan})

savepath = os.path.join('..', 'datasets', 'ESS2018DK_subset.csv')
df.to_csv(savepath, index = False)