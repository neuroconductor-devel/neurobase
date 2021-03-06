% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/slice_colour_df.R
\name{slice_colour_df}
\alias{slice_colour_df}
\title{Slice a Image Color Data.frame}
\usage{
slice_colour_df(img_df, xyz = NULL)
}
\arguments{
\item{img_df}{an image \code{data.frame}, usually from 
\code{\link{img_colour_df}}.  Must have the columns: \code{dim1},
\code{dim2}, \code{dim3}, \code{colour}, and \code{value}.}

\item{xyz}{coordinates to slice the \code{data.frame} in x, y, and z - domains}
}
\value{
A \code{data.frame} with x and y coordinates, colour, and intensity
values, along with the associated planes that were sliced.
}
\description{
Slices a image color \code{data.frame} along the 3 planes (axial,
coronal, sagittal) and returns it in a ggplot-ready format for faceting.
}
\examples{
img = nifti(array(rnorm(10^3), dim = rep(10, 3)))
df = img_colour_df(img)
sliced = slice_colour_df(df, c(5, 5, 4))
}
