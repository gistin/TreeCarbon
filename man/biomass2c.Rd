% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{biomass2c}
\alias{biomass2c}
\title{Convert Biomass to Carbon}
\usage{
biomass2c(biomass, method, type = NA, sig_biomass = NULL, biome = "temperate")
}
\arguments{
\item{biomass}{Numeric vector, representing biomass values (typically in kg
or metric tonnes).}

\item{method}{Character. Method defining the carbon volatile fraction (CF).
Supported methods:
\itemize{
\item \code{"Matthews1"}: Simplest, CF = 50\% (Matthews, 1993).
\item \code{"Matthews2"}: CF based on type (broadleaf or conifer).
\item \code{"IPCC1"}: CF = 47.7\% (IPCC, 2006).
\item \code{"IPCC2"}: Lookup CF by type and biome.
\item \code{"Thomas"}: Lookup by type and biome (Thomas & Martin, 2012).
}
Method defining carbon volatile fraction (CF) see CVF_df.RData
\link{1: Matthews, 1993} "Matthews1": Simplest, CF = 50\%.
"Matthews2": CF based on type (broadleaf or conifer)
\link{2: IPCC, 2006} "IPCC1": CF = 47.7\%
"IPCC2": Lookup CF by type and biome
\link{3: Thomas and Martin, 2012} "Thomas": Lookup by type and biome}

\item{type}{Character vector. \code{"broadleaf"} or \code{"conifer"}. Required for
\code{"Matthews2"}, \code{"IPCC2"}, or \code{"Thomas"}.}

\item{sig_biomass}{Numeric vector. Biomass uncertainty (optional, only used
with \code{"IPCC2"} and \code{"Thomas"} methods).}

\item{biome}{Character vector. Biome classification, required for \code{"IPCC2"}
and \code{"Thomas"} methods. Accepted values: \code{"tropical"}, \code{"subtropical"},
\code{"mediterranean"}, \code{"temperate"}, or \code{"boreal"}.}
}
\value{
Numeric vector of carbon values. If \code{sig_biomass} is provided,
returns a data frame with columns \code{"AGC"} (above-ground carbon) and
\code{"sig_AGC"} (associated uncertainty).
}
\description{
Converts biomass values to carbon values using the carbon
fraction (CF) from the chosen method or citation.
}
\examples{
# Basic conversion using IPCC2 method
biomass2c(1, method = "IPCC2", type = "conifer", biome = "temperate")

# Vectorized conversion with uncertainty
biomass2c(biomass=c(0.5, 0.75, 2, 7), method = "IPCC2", type = rep("broadleaf", 4),
          sig_biomass = rep(0.2, 4), biome = "temperate")

}
\references{
Thomas, S.C., & Martin, A.R. (2012). Carbon content of tree tissues: A synthesis.
\emph{Forests, 3}(2), 332-352. \doi{10.3390/f3020332}

IPCC. (2006). Forest lands. \emph{Intergovernmental Panel on Climate Change Guidelines}
for National Greenhouse Gas Inventories, Volume 4, p. 83.

Matthews, G.A.R. (1993). \emph{The Carbon Content of Trees.} Forestry Commission Technical
Paper 4, Forestry Commission, Edinburgh, 21 pp. ISBN: 0-85538-317-8.

\link{1} Thomas, Sean C., and Adam R. Martin. "Carbon content of tree
tissues: a synthesis." Forests 3.2 (2012): 332-352.
https://www.mdpi.com/1999-4907/3/2/332.
\link{2} IPCC. Forest lands. Intergovernmental Panel on Climate Change Guidelines
for National Greenhouse Gas Inventories; Institute for Global Environmental
Strategies (IGES): Hayama,Japan, 2006; Volume 4, p. 83.
\link{3} Matthews, G.A.R. (1993) The Carbon Content of Trees. Forestry Commission
Technical Paper 4. Forestry Commission, Edinburgh. 21pp. ISBN: 0-85538-317-8
}
\author{
Justin Moat \href{mailto:J.Moat@kew.org}{J.Moat@kew.org}, Isabel Openshaw \href{mailto:I.Openshaw@kew.org}{I.Openshaw@kew.org}
}
