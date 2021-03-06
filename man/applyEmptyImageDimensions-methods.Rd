% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/applyEmptyImageDimensions.R
\docType{methods}
\name{applyEmptyImageDimensions-methods}
\alias{applyEmptyImageDimensions-methods}
\alias{applyEmptyImageDimensions}
\alias{applyEmptyImageDimensions,nifti-method}
\alias{applyEmptyImageDimensions,character-method}
\alias{applyEmptyImageDimensions,factor-method}
\alias{applyEmptyImageDimensions,list-method}
\alias{applyEmptyImageDimensions,array-method}
\alias{applyEmptyImageDimensions,anlz-method}
\alias{applyEmptyImageDimensions,ANY-method}
\alias{apply_empty_dim}
\title{Apply Subsetting from Empty Image Dimensions}
\usage{
applyEmptyImageDimensions(img, inds, reorient = FALSE, ...)

\S4method{applyEmptyImageDimensions}{nifti}(img, inds, reorient = FALSE, ...)

\S4method{applyEmptyImageDimensions}{character}(img, inds, reorient = FALSE, ...)

\S4method{applyEmptyImageDimensions}{factor}(img, inds, reorient = FALSE, ...)

\S4method{applyEmptyImageDimensions}{list}(img, inds, reorient = FALSE, ...)

\S4method{applyEmptyImageDimensions}{array}(img, inds, reorient = FALSE, ...)

\S4method{applyEmptyImageDimensions}{anlz}(img, inds, reorient = FALSE, ...)

\S4method{applyEmptyImageDimensions}{ANY}(img, inds, reorient = FALSE, ...)

apply_empty_dim(img, ...)
}
\arguments{
\item{img}{image, nifti object, or array}

\item{inds}{indices of subset from \code{\link{getEmptyImageDimensions}} or
\code{\link{dropEmptyImageDimensions}}.}

\item{reorient}{Should image be reoriented if a filename?}

\item{...}{not used}
}
\value{
Object of class \code{nifti} or \code{array} if \code{nifti}
is not supplied
}
\description{
Simple wrapper for subsetting an image with indices, 
dropping empty dimensions.
}
\note{
\code{apply_empty_dim} is a shorthand for 
\code{applyEmptyImageDimensions} with all the same arguments.
}
\examples{
set.seed(5)
dims = rep(10, 3)
arr = array(rnorm(prod(dims)), dim = dims)
arr[,,10] = 0
nim = oro.nifti::nifti(arr)
inds = getEmptyImageDimensions(nim)
inds_arr = getEmptyImageDimensions(arr)
testthat::expect_equal(inds, inds_arr)

out = applyEmptyImageDimensions(nim, inds = inds)
out_arr = applyEmptyImageDimensions(arr, inds = inds)
testthat::expect_equal(out_arr, array(out, dim = dim(out)))
out = apply_empty_dim(nim, inds = inds)

set.seed(5)
dims = rep(10, 3)
arr = array(rnorm(prod(dims)), dim = dims)
arr[,,10] = 0
nim = oro.nifti::nifti(arr)
inds = getEmptyImageDimensions(nim)
rnifti = RNifti::asNifti(nim)
timg = tempimg(nim)
limg = list(factor(timg), factor(timg))
apply_empty_dim(nim, inds = inds)
func = function(...) applyEmptyImageDimensions(..., inds = inds)
func(arr)
func(nim)
func(rnifti)
func(timg)
func(limg)



}
\seealso{
\code{\link{getEmptyImageDimensions}}, 
\code{\link{dropEmptyImageDimensions}}
}
