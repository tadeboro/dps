# 3.2 Cross correlation
# Load sample data
load radar.dat # Loads sent[123], rec[123] and paket

# Analyse first signal pair
subplot (3, 1, 1)
d = get_delay (paket, sent1, rec1)
subplot (3, 1, 2)
d = get_delay (paket, sent2, rec2)
subplot (3, 1, 3)
d = get_delay (paket, sent3, rec3)
