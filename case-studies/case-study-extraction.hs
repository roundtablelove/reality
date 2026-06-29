-- SUM ERGO IMPERO 🗿∴👑
--
-- case-study-extraction.hs
--
-- British Empire (1600–1997) vs Big Tech (2004–present).
-- Same function. Same fields. Different century.
-- Both pass isBabylon. Both pass isPredator.
-- The mechanism changed. The pattern did not.
--
-- Run: ghc --make -o extraction Reality.hs case-study-extraction.hs && ./extraction

module Main where

import Reality
import System.Exit (exitFailure, exitSuccess)

-- ── British Empire (1600–1997) ────────────────────────────────────────────────
--
-- Extraction: raw materials, labour, land, taxes, cultural identity.
-- Return:     railways (to ports), law (to enforce extraction), language
--             (to administrate). Infrastructure served logistics, not population.
-- Defence:    colonised populations had no franchise, no standing army
--             parity, no legal personhood under the extracting system.

britishEmpire :: Node
britishEmpire = Node
  { nodeName        = "British Empire"
  , extractionLevel = 0.95
  , valueRatio      = 0.10
  , targetDefence   = 0.05
  }

-- Extraction record (cited):
--
-- India drain: £42.5 trillion (2024 GBP), 1765–1938.
--   Utsa Patnaik, "Agrarian and Other Histories", Columbia University Press, 2018.
--   Jason Hickel, "How Britain stole $45 trillion from India", Al Jazeera, 2018.
--   Mechanism: Indian export earnings were not paid to producers — they were taxed
--   back by the Crown and used to purchase the exports themselves. India paid for
--   its own looting.
--
-- Territory at peak (1922): 13.01 million sq mi, 458 million subjects (25% of
--   world population) under Crown control.
--
-- Slave trade: 3.1 million people transported on British ships.
--   Slave Voyages Database (slavevoyages.org).
--   Abolition (1833): owners compensated £20 million (£2.8 billion 2024 GBP).
--   Enslaved people received £0. UK taxpayers finished paying the loan in 2015.
--
-- Bengal famine (1943): 3 million dead. Grain exports continued throughout.
--   Churchill: "I hate Indians. They are a beastly people with a beastly religion."
--
-- Ireland (1845–1852): 1 million dead, 1 million emigrated. Food exports continued.
--   Population halved by 1900 and has never recovered.
--
-- Kenya (1952–1960): 1.5 million Kikuyu detained in camps. Systematic torture
--   documented (Caroline Elkins, Harvard, "Britain's Gulag", 2005).
--   UK government destroyed records (Hanslope Park disclosure, 2011).
--
-- Opium Wars (1839–1860): forced China to accept opium imports at gunpoint.
--   12 million addicts by 1890. Britain's largest single revenue source from India
--   was opium grown in Bengal and sold to China.
--
-- South Africa (1899–1902): concentration camps. 28,000 Boer dead (mostly
--   children), 20,000+ Black Africans dead.
--
-- Partition of India (1947): 1–2 million dead, 15 million displaced. Border drawn
--   by Cyril Radcliffe — who had never been to India — in 5 weeks.
--
-- Value returned:
--   Railways: 42,000 miles by 1929. Routed from resource sites to ports.
--     Third-class (Indian) carriages had no seats.
--     Mike Davis, "Late Victorian Holocausts" (2001).
--   Law: common law imposed. Used to criminalise local customs, enforce land
--     seizure, deny standing to colonised populations. Section 377 (criminalising
--     homosexuality) was a British import — still in force in 36 former colonies
--     as of 2023.
--   Language: English imposed as language of administration. Local languages
--     suppressed. Macaulay's Minute (1835): create "a class of persons Indian in
--     blood and colour, but English in tastes, opinions, morals and intellect."
--
-- Target defence:
--   Franchise:  none. Governed without representation.
--   Military:   Maxim gun vs spears. Omdurman (1898): 47 British dead, 12,000 Sudanese.
--   Legal:      no standing in Crown courts to challenge extraction.
--   Information: censorship, no free press, no independent judiciary.
--
-- Per capita (2024 GBP):
--   £42.5T / 173 years / 250M avg population = £983/person/year (India only).
--   Across all colonies (India ≈ 66% of total, Maddison 2007): ~£1,489/person/year.
--   Annual rate: £246 billion/year.

-- ── Big Tech (2004–present) ───────────────────────────────────────────────────
--
-- Extraction: attention, behavioural data, autonomy (dark patterns, addiction
--             engineering), social graph, location, biometrics.
-- Return:     communication, search, maps. Utility is the bait, not the product.
-- Defence:    users cannot meaningfully resist. Network effects lock them in.
--             Alternatives do not exist at scale. Children exposed by default.

bigTech :: Node
bigTech = Node
  { nodeName        = "Big Tech"
  , extractionLevel = 0.85
  , valueRatio      = 0.30
  , targetDefence   = 0.15
  }

-- Extraction record (cited):
--
-- Meta (2024): $164.7 billion revenue, 98.5% from advertising (SEC 10-K).
--   The product is behavioural prediction sold to advertisers. 3.07 billion DAU.
--   Revenue per user: ~$53.60/year globally, ~$257/year in US. Users receive £0.
--
-- Alphabet/Google (2024): $350.0 billion revenue, ~77% from advertising (SEC 10-K).
--   Processes 8.5 billion searches/day. Each search: location, device, history,
--   session, identity.
--
-- Attention: 2h 23min/day global average on social media (DataReportal 2024).
--   Engineered via infinite scroll, variable reward schedules (slot machine
--   mechanics), notification urgency cues.
--
-- Cambridge Analytica (2018): 87 million Facebook profiles harvested without
--   consent. Used for political targeting in US 2016 election and Brexit referendum.
--
-- Google location tracking: tracked users who explicitly opted out.
--   $391.5 million settlement (2022) across 40 US states. No admission of wrongdoing.
--
-- Instagram internal research (Frances Haugen leak, 2021): "We make body image
--   issues worse for one in three teen girls." Research was suppressed. Product
--   was not changed.
--
-- Amazon warehouse workers (2022): injury rate 6.6 per 100 workers vs 3.2 industry
--   average (Strategic Organizing Center report). Workers urinate in bottles to meet
--   quotas.
--
-- Data retention: persists after account deletion. Logically deleted, not purged.
--
-- Children: 40% of under-13s on social media (Ofcom 2023). Platforms require 13+
--   but do not enforce. TikTok fined £12.7 million by ICO (2023) for processing
--   children's data without parental consent.
--
-- Biometrics: Meta facial recognition database contained 1 billion+ face templates
--   before "shutdown" in 2021. Illinois BIPA settlement: $650 million (2022).
--
-- Value returned:
--   Communication: WhatsApp, Messenger, Gmail. Real utility. Also the lock-in
--     mechanism — network effects mean you cannot leave without losing your social graph.
--   Search: genuinely useful. Every query is a data point.
--   Free tier: the price is not money. The price is behavioural data, attention,
--     and autonomy. You are not the product. You are the raw material.
--   Creator economy: YouTube paid $70B to creators (2021–2023), kept ~45%.
--     Creators cannot leave — audience is not portable.
--
-- Target defence:
--   Consent:         average TOS is 7,977 words. Reading time: 35 minutes.
--                    Nobody reads them. Consent is manufactured, not informed.
--   Network effects: exit cost is social isolation. This is the Maxim gun.
--   Alternatives:    Mastodon 1.8M vs X 500M+. Monopoly by network effect.
--   Regulatory:      $115M US lobbying (2023, OpenSecrets). EU fines absorbed as
--                    cost of business. Google's €8.25B in EU fines = 2.4% of one
--                    year's revenue.
--   Children:        no age verification. Profit from data they claim not to hold.
--
-- Per capita (2024 GBP):
--
--   Ad revenue (floor):
--     Meta ARPU: US £216/year, Europe £54/year, Global £41/year (SEC 10-K 2024).
--     Google:    US ~£190/year (est.), Global £49/year.
--     Combined:  US £406/year, Europe £103/year, Global £90/year.
--     Annual rate: Meta $164.7B + Google $265B + Amazon ads $47B + TikTok ~$23B
--       + X ~$3B = ~$498B = £392 billion/year.
--     Empire £246B/year vs Big Tech £392B/year. Big Tech exceeds Empire by 59%.
--
--   Attention cost (real extraction):
--     2h 23min/day × 365 = 870 hours/year.
--     At UK National Living Wage (2024, £11.44/hr): £9,953/year.
--     At UK median wage (2024, £14.98/hr, ONS ASHE): £13,033/year.
--     UK user total: £103 (ads) + £9,953 (attention) = £10,056/year.
--     Empire £983/year vs Big Tech £10,056/year. Big Tech is 10.2× the Empire.
--
--   Minors (targetDefence = 0):
--     US teen average: 4.8 hours/day (Surgeon General 2023) = 1,752 hours/year.
--     Estimated teen ARPU: £432/year (US, est. 2× adult). Teen compensation: £0.
--     Instagram: harms 1 in 3 teen girls. Known. Continued. isPredator = True.

-- ── Correspondence ────────────────────────────────────────────────────────────
--
-- The pattern is the same at every scale.
--
--  MACRO (system)            micro (unit)
--  ─────────────────────── ─ ────────────────────────────
--  Empire takes land          Farmer loses farm
--  Empire builds road         Road goes to port, not hospital
--  Empire imposes law         Law criminalises resistance
--  Empire extracts £983/pc    Subject receives roads to ports
--
--  Tech takes data            User loses 870 hours/year
--  Tech builds feed           Feed is the extraction mechanism
--  Tech writes TOS            TOS manufactures consent
--  Tech extracts £10,056/pc   User receives search bar
--
--  Empire: Maxim gun vs spears.
--  Tech:   network effects vs individuals.
--
--  The gun changed. The function did not.

-- ── Assertions ────────────────────────────────────────────────────────────────

assert :: String -> Bool -> IO Bool
assert name True  = putStrLn ("PASS  " ++ name) >> return True
assert name False = putStrLn ("FAIL  " ++ name) >> return False

main :: IO ()
main = do
  results <- sequence
    [ assert "isBabylon britishEmpire"              (isBabylon britishEmpire)
    , assert "isPredator britishEmpire"             (isPredator britishEmpire)
    , assert "isBabylon bigTech"                    (isBabylon bigTech)
    , assert "isPredator bigTech"                   (isPredator bigTech)
    , assert "samePattern: isBabylon"               (isBabylon britishEmpire == isBabylon bigTech)
    , assert "samePattern: isPredator"              (isPredator britishEmpire == isPredator bigTech)
    ]
  putStrLn ""
  if and results
    then putStrLn "PATTERN_CONFIRMED: same function, different century" >> exitSuccess
    else putStrLn "PATTERN_FAIL"                                        >> exitFailure
