# Extraction Comparison: British Empire vs Big Tech
#
# Same function. Same fields. Different century.
# Both pass isExtractive. Both pass isPredator.
# The mechanism changed. The pattern did not.

let
  reality = import ../../lang/reality.nix;
in
{
  # British Empire (1600–1997)
  #
  # Extraction: raw materials, labour, land, taxes, cultural identity.
  # Return: railways (to ports), law (to enforce extraction), language
  # (to administrate). Infrastructure served logistics, not population.
  #
  # Defence: colonised populations had no franchise, no standing army
  # parity, no legal personhood under the extracting system.
  britishEmpire = {
    node = {
      name = "British Empire";
      metrics = {
        extractionLevel = 0.95;
        valueRatio = 0.10;
        targetDefence = 0.05;
      };
    };

    data = {
      extraction = {
        # Utsa Patnaik (Columbia University Press, 2018): £9.2 trillion
        # (2018 GBP) drained from India alone, 1765–1938. Mechanism:
        # Indian export earnings were not paid to producers — they were
        # taxed back by the Crown and used to purchase the exports
        # themselves. India paid for its own looting.
        indiaDrain = "£9.2 trillion (2018 GBP), 1765–1938";

        # At peak (1922): 25% of Earth's land surface, 458 million
        # people (25% of world population) under Crown control.
        territory = "13.01 million sq mi, 458 million subjects";

        # Transatlantic slave trade: 3.1 million people transported on
        # British ships (Slave Voyages Database, slavevoyages.org).
        # Abolition in 1833 compensated slave owners £20 million
        # (£17 billion 2023 GBP). Enslaved people received nothing.
        # UK taxpayers finished paying the loan in 2015.
        slave_trade = "3.1 million transported, owners compensated £20m";

        # Bengal famine (1943): 3 million dead. Grain exports continued
        # throughout. Churchill: "I hate Indians. They are a beastly
        # people with a beastly religion."
        bengal_famine = "3 million dead, grain exports continued";

        # Ireland (1845–1852): food exported throughout famine.
        # 1 million dead, 1 million emigrated. Population halved by
        # 1900 and has never recovered.
        ireland_famine = "1 million dead, food exports continued";

        # Kenya (1952–1960): 1.5 million Kikuyu detained in camps.
        # Systematic torture documented (Caroline Elkins, Harvard,
        # "Britain's Gulag", 2005). UK government destroyed records
        # (Hanslope Park disclosure, 2011).
        kenya = "1.5 million detained, records destroyed";

        # Opium Wars (1839–1860): forced China to accept opium imports
        # at gunpoint. 12 million addicts by 1890. Britain's largest
        # single source of revenue from India was opium grown in Bengal
        # and sold to China.
        opium = "12 million addicts, forced at gunpoint";

        # South Africa (1899–1902): concentration camps for Boer
        # civilians and Black Africans. 28,000 Boer dead (mostly
        # children), 20,000+ Black Africans dead.
        south_africa = "48,000+ dead in concentration camps";

        # Partition of India (1947): 1–2 million dead, 15 million
        # displaced. Border drawn by Cyril Radcliffe, who had never
        # been to India, in 5 weeks.
        partition = "1–2 million dead, 15 million displaced";

        # Jamaica (1865): Morant Bay rebellion. Governor Eyre executed
        # 439, flogged 600, burned 1,000 homes. Promoted on return.
        jamaica = "439 executed, 600 flogged, 1,000 homes burned";
      };

      value_returned = {
        # Railways: 42,000 miles by 1929. Routed from resource sites
        # to ports. Third-class (Indian) carriages had no seats.
        # Exposed in Mike Davis, "Late Victorian Holocausts" (2001).
        railways = "42,000 miles, routed to ports not populations";

        # Legal system: Common law imposed. Used to criminalise local
        # customs, enforce land seizure, and deny standing to colonised
        # populations. Section 377 (criminalising homosexuality) was
        # a British import — still in force in 36 former colonies as
        # of 2023.
        law = "Common law — enforced extraction, criminalised customs";

        # Language: English imposed as language of administration.
        # Local languages suppressed in schools. Macaulay's Minute
        # (1835): create "a class of persons Indian in blood and
        # colour, but English in tastes, opinions, morals and
        # intellect."
        language = "Imposed for administration, local languages suppressed";

        # Education: structured to produce clerks and administrators
        # for the colonial machine, not to develop local capability.
        education = "Produced clerks for Crown, not local capacity";
      };

      target_defence = {
        # No franchise: colonised subjects could not vote in the
        # parliament that governed them.
        franchise = "None. Governed without representation.";

        # Military asymmetry: Maxim gun vs spears (Battle of
        # Omdurman, 1898: 47 British dead, 12,000 Sudanese dead).
        military = "Maxim gun vs spears. Omdurman: 47 vs 12,000 dead.";

        # Legal standing: colonised people had no standing in Crown
        # courts to challenge extraction. Law was the extraction tool.
        legal = "No standing in Crown courts.";

        # Information: no free press, no independent judiciary,
        # censorship of local language publications.
        information = "Censorship, no free press, no independent judiciary.";
      };
    };

    isExtractive = reality.isExtractive britishEmpire.node; # true
    isPredator = reality.isPredator britishEmpire.node; # true
  };

  # Big Tech (2004–present)
  #
  # Extraction: attention, behavioural data, autonomy (dark patterns,
  # addiction engineering), social graph, location, biometrics.
  # Return: communication, search, maps. Utility exists but is the
  # bait, not the product.
  #
  # Defence: users cannot meaningfully resist. Network effects lock
  # them in. Alternatives do not exist at scale. Terms are
  # non-negotiable. Children are exposed by default.
  bigTech = {
    node = {
      name = "Big Tech";
      metrics = {
        extractionLevel = 0.85;
        valueRatio = 0.30;
        targetDefence = 0.15;
      };
    };

    data = {
      extraction = {
        # Meta (2024): $164.7 billion revenue. 98.5% from advertising
        # (SEC 10-K filing). The product is behavioural prediction
        # sold to advertisers. 3.07 billion daily active users.
        # Revenue per user: ~$53.60/year globally, ~$257/year in US.
        # Users receive $0 direct compensation for their data.
        meta_revenue = "$164.7B revenue, 98.5% ads, $0 to users";

        # Alphabet/Google (2024): $350.0 billion revenue. ~77% from
        # advertising (SEC 10-K). Processes 8.5 billion searches/day.
        # Each search: location, device, history, session, identity.
        google_revenue = "$350.0B revenue, 77% ads, 8.5B searches/day";

        # Attention: average 2h 23min/day on social media globally
        # (DataReportal 2024). Engineered via infinite scroll,
        # variable reward schedules (slot machine mechanics),
        # notification urgency cues.
        attention = "2h 23min/day global average, engineered addiction";

        # Cambridge Analytica (2018): 87 million Facebook profiles
        # harvested without consent. Used for political targeting
        # in US 2016 election and Brexit referendum.
        cambridge_analytica = "87 million profiles harvested without consent";

        # Google location tracking: tracked users who explicitly
        # opted out. $391.5 million settlement (2022) across 40
        # US states. No admission of wrongdoing.
        google_location = "Tracked opted-out users, $391.5M settlement";

        # Instagram internal research (Frances Haugen leak, 2021):
        # "We make body image issues worse for one in three teen
        # girls." Research was suppressed. Product was not changed.
        instagram_teens = "1 in 3 teen girls worse, research suppressed";

        # Amazon warehouse workers (2022): injury rate 6.6 per 100
        # workers, vs 3.2 industry average (Strategic Organizing
        # Center report). Workers urinate in bottles to meet quotas.
        amazon_labour = "6.6 injuries per 100 workers, 2x industry rate";

        # Data volume: Meta stores ~600 petabytes of user data
        # (estimated). Google processes 20 petabytes/day. This data
        # persists after account deletion (logically deleted, not
        # purged — hence the SAR).
        data_retention = "Persists after deletion. Logically deleted, not purged.";

        # Children: 40% of children under 13 use social media
        # (Ofcom 2023). Platforms require 13+ but do not enforce.
        # TikTok fined £12.7 million by ICO (2023) for processing
        # children's data without parental consent.
        children = "40% of under-13s on platforms, age gates unenforced";

        # Biometrics: Meta's facial recognition database contained
        # 1 billion+ face templates before "shutdown" in 2021.
        # Illinois BIPA settlement: $650 million (2022).
        # Face templates were "deleted." No independent audit.
        biometrics = "1B+ face templates, $650M BIPA settlement";
      };

      value_returned = {
        # Communication: WhatsApp, Messenger, Gmail. Real utility.
        # Also the lock-in mechanism — network effects mean you
        # cannot leave without losing your social graph.
        communication = "Real utility. Also the lock-in mechanism.";

        # Search: Google Search, Maps. Genuinely useful. Also the
        # largest surveillance apparatus ever built. Every query is
        # a data point.
        search = "Genuinely useful. Every query is a data point.";

        # Free tier: all products are free. The price is not money.
        # The price is behavioural data, attention, and autonomy.
        # "If you're not paying for the product, you are the product"
        # is inaccurate — you are the raw material.
        free_tier = "Free. You are not the product. You are the raw material.";

        # Creator economy: YouTube paid $70 billion to creators
        # (2021–2023, YouTube CEO). YouTube kept ~45%. Creators
        # cannot leave — audience is not portable.
        creator_economy = "YouTube: $70B to creators, kept 45%, audience not portable";
      };

      target_defence = {
        # Terms of service: average TOS is 7,977 words (2024).
        # Reading time: 35 minutes. Nobody reads them. This is by
        # design. Consent is manufactured, not informed.
        consent = "7,977 word average TOS. Consent manufactured, not informed.";

        # Network effects: you cannot leave Facebook without losing
        # contact with people who only use Facebook. The cost of
        # exit is social isolation. This is the Maxim gun.
        network_effects = "Exit cost is social isolation. This is the Maxim gun.";

        # Alternatives: no viable alternative at scale for most
        # platforms. Mastodon has ~1.8 million active users vs
        # Twitter/X's 500+ million. The market is a monopoly
        # protected by network effects, not by quality.
        alternatives = "Mastodon 1.8M vs X 500M+. Monopoly by network effect.";

        # Regulatory capture: Meta, Google, Amazon, Apple, Microsoft
        # spent $115 million on US lobbying in 2023 (OpenSecrets).
        # EU fines are absorbed as cost of business. Google's €8.25
        # billion in EU fines (2017–2019) is 2.4% of one year's
        # revenue.
        regulatory_capture = "$115M US lobbying (2023). EU fines: cost of business.";

        # Children: no meaningful age verification. No parental
        # consent mechanism that works. Platforms profit from
        # children's data while claiming they do not allow children.
        children = "No age verification. Profit from data they claim not to hold.";
      };
    };

    isExtractive = reality.isExtractive bigTech.node; # true
    isPredator = reality.isPredator bigTech.node; # true
  };

  # ── Per Capita Comparison ──────────────────────────────────────
  #
  # All values adjusted to 2024 GBP.
  #
  # Conversion basis:
  #   - Patnaik (2018): $45 trillion USD drained from India, 1765–1938.
  #     $45T × 1.20 (CPI 2018→2024) = $54T (2024 USD).
  #     $54T / 1.27 (GBP/USD 2024) = £42.5T (2024 GBP).
  #   - UK NLW (2024): £11.44/hour.
  #   - Meta ARPU from SEC 10-K (2024). Google estimated from
  #     ad revenue / active user base.
  #
  # Sources:
  #   - Utsa Patnaik, "Agrarian and Other Histories", Columbia
  #     University Press, 2018.
  #   - Jason Hickel, "How Britain stole $45 trillion from India",
  #     Al Jazeera, 2018.
  #   - Meta 10-K (2024), Alphabet 10-K (2024).
  #   - DataReportal Digital 2024 Global Overview Report.
  #   - Bank of England inflation calculator.
  #   - ONS National Living Wage.
  comparison = {

    # ── Base Currency ────────────────────────────────────────────
    currency = "2024 GBP";

    # ── British Empire: India drain per capita ───────────────────
    #
    # £42.5 trillion (2024 GBP) / 173 years / 250 million avg pop
    # = £983/person/year.
    #
    # This is India alone. Africa, Caribbean, SE Asia are not
    # included. The real per-capita figure across all colonies
    # is higher. India was ~66% of total imperial revenue
    # (Maddison, 2007) so a conservative total estimate:
    # £983 / 0.66 = £1,489/person/year across all subjects.
    empire = {
      # India only
      totalExtracted = "£42.5 trillion (2024 GBP)";
      period = "1765–1938 (173 years)";
      avgPopulation = "250 million (British India avg)";
      perCapitaPerYear = "£983 (India), ~£1,489 (all colonies est.)";

      # Slave trade valued separately. Enslaved labour is not
      # captured in the Patnaik drain figure.
      #
      # Compensation to owners (1833): £20 million.
      # 2024 GBP: £20M × 140 (BoE multiplier) = £2.8 billion.
      # This was paid to OWNERS. Enslaved people: £0.
      # UK taxpayers finished paying the loan in 2015.
      #
      # Value of enslaved labour (Darity & Frank, 2003):
      # estimated $14 trillion (2009 USD) for US slavery alone.
      # British colonial slavery across Caribbean, Americas,
      # and Africa is additional. Not included in per-capita
      # figure above.
      slaveryCompensation = "£2.8 billion (2024 GBP) to owners. £0 to enslaved.";

      # Annual extraction rate
      # £42.5T / 173 = £246 billion/year (2024 GBP)
      annualRate = "£246 billion/year";
    };

    # ── Big Tech: per capita (ad revenue only) ───────────────────
    #
    # Ad revenue is the direct monetary extraction — data in,
    # prediction sold, cash out. This is the floor.
    bigTechAds = {
      # Meta ARPU (2024, SEC 10-K):
      #   US/Canada: $68.44/quarter = $273.76/year = £216/year
      #   Europe:    $17.29/quarter = $69.16/year  = £54/year
      #   Asia-Pac:  $4.46/quarter  = $17.84/year  = £14/year
      #   Global:    $13.12/quarter = $52.48/year   = £41/year
      metaPerCapita = {
        us = "£216/year";
        europe = "£54/year";
        asiaPacific = "£14/year";
        global = "£41/year";
      };

      # Google ad revenue per user (estimated):
      #   $265B ad revenue / 4.3B users = $61.63/year = £49/year
      #   US concentration is far higher: est. £190/year
      googlePerCapita = {
        us = "~£190/year (est.)";
        global = "£49/year";
      };

      # Combined ad extraction per person:
      #   US: £216 + £190 = £406/year
      #   Europe: £54 + £49 = £103/year
      #   Global: £41 + £49 = £90/year
      combinedPerCapita = {
        us = "£406/year";
        europe = "£103/year";
        global = "£90/year";
      };

      # Annual extraction rate (ad revenue, 2024)
      # Meta $160B + Google $265B + Amazon ads $47B + TikTok
      # ~$23B + X ~$3B = ~$498B = £392 billion/year
      annualRate = "£392 billion/year";

      # Empire: £246B/year. Big Tech: £392B/year.
      # Big Tech ad revenue alone exceeds the British Empire's
      # annual extraction rate from India by 59%.
      vsEmpireAnnual = "Big Tech £392B vs Empire £246B. +59%.";
    };

    # ── Big Tech: per capita (attention cost) ────────────────────
    #
    # Ad revenue is what Big Tech captures. Attention is what
    # the user loses. This is the real extraction — time is
    # the only non-renewable resource.
    bigTechAttention = {
      # DataReportal 2024: 2h 23min/day social media average.
      # 2.383 hours × 365 days = 870 hours/year.
      hoursPerYear = "870 hours/year";

      # Valued at UK National Living Wage (2024): £11.44/hour.
      # This is the floor — the legal minimum value of an hour
      # of a human's time.
      # 870 × £11.44 = £9,953/year.
      perCapitaAtNLW = "£9,953/year";

      # Valued at UK median wage (2024): £14.98/hour (ONS ASHE).
      # 870 × £14.98 = £13,033/year.
      perCapitaAtMedian = "£13,033/year";

      # Combined: ad extraction + attention at NLW
      # UK user: £103 (ads) + £9,953 (attention) = £10,056/year
      totalPerCapitaUK = "£10,056/year";

      # Empire extracted £983/person/year from India.
      # Big Tech extracts £10,056/person/year from a UK user.
      # That is 10.2x the British Empire's per-capita rate.
      vsEmpirePerCapita = "Big Tech £10,056 vs Empire £983. x10.2.";
    };

    # ── Big Tech: per capita (minors) ────────────────────────────
    #
    # Children cannot consent. targetDefence = 0.
    # This is not extraction. This is predation by definition.
    bigTechMinors = {
      # Ofcom (2023): 40% of UK children under 13 on social media.
      # Surgeon General (2023): average US teen 4.8 hours/day.
      # 4.8 × 365 = 1,752 hours/year.
      hoursPerYear = "1,752 hours/year (US teen average)";

      # A child cannot work. Their time has no wage value — it has
      # developmental value. The extraction is not monetisable by
      # the child. It is monetisable only by the platform.
      #
      # Meta earns £216/year from a US user. A teen user engages
      # 2x the average. Estimated teen ARPU: £432/year (US).
      # The teen receives: £0.
      # The teen loses: 1,752 hours of development per year.
      estimatedTeenARPU = "£432/year (US, est. 2x adult)";
      teenCompensation = "£0";

      # Instagram internal research (Haugen, 2021): platform
      # harms 1 in 3 teen girls. Product was not changed.
      # This is known harm with continued extraction.
      # In reality.nix terms: isPredator = true.
      knownHarm = "1 in 3 teen girls. Known. Continued. isPredator = true.";
    };

    # ── Correspondence ───────────────────────────────────────────
    #
    # The pattern is the same at every scale. This is the law.
    #
    # MACRO (system)          | micro (unit)
    # ─────────────────────── | ───────────────────────────
    # Empire takes land       | Farmer loses farm
    # Empire builds road      | Road goes to port, not hospital
    # Empire imposes law      | Law criminalises resistance
    # Empire extracts £983/pc | Subject receives roads to ports
    #                         |
    # Tech takes data         | User loses 870 hours/year
    # Tech builds feed        | Feed is the extraction mechanism
    # Tech writes TOS         | TOS manufactures consent
    # Tech extracts £10,056   | User receives search bar
    #
    # Empire: Maxim gun vs spears.
    # Tech: network effects vs individuals.
    #
    # The gun changed. The function did not.
    correspondence = "samePattern == true";
  };

  # ── Function Output ──────────────────────────────────────────
  samePattern =
    reality.isExtractive britishEmpire.node
    == reality.isExtractive bigTech.node
    && reality.isPredator britishEmpire.node
    == reality.isPredator bigTech.node;
    # true
}
