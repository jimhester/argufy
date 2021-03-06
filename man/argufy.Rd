% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/package.R
\name{argufy}
\alias{argufy}
\title{Add argument checks to a function}
\usage{
argufy(fun, ...)
}
\arguments{
\item{fun}{The function to add the argument checks to.
The argument checks are specified in the original argument list
of \code{fun}. See details below.}

\item{...}{Function arguments to modify, this allows you to argufy existing
function definitions.}
}
\value{
Another function that is equivalent to \code{fun}, but implements
the declared argument checks.
}
\description{
Function argument assertions via a concise declerative syntax.
The actual assertion code is generated automatically and inserted
at the beginning into the function.
}
\details{
Assertions are separated from the argument names by the
\code{?} or the \code{?~} operators. See examples below. Note that the equation
signs must be present in front of the question mark, even if the
argument does not have a default value.

Assertions come in three forms:
\enumerate{
\item If the assertion is a function whose name starts with \code{is.} or
\code{is_}, then this function must return true for the argument's value.
\item If the assertion is a function whose name starts with \code{as.} or
\code{as_}, then this is used as a coercion function for the argument.
\item Otherwise the assertion must be a complete expression that
evaluated to \code{TRUE}. You can refer to the argument and to other
arguments within the assertion.
}
}
\examples{
prefix <- argufy(function(
 str =     ?~ as.character,
 len = 3   ?  is.numeric(len) && length(len) == 1 && is.finite(len)
) {
  substring(x, 1, y)
})

prefix

# modify tolower to fail if given a non-character
tolower <- argufy(base::tolower, x = ? is.character)

\dontrun{
  tolower(1)
}
}

