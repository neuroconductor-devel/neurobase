% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checkniigz.R
\docType{methods}
\name{checkniigz-methods}
\alias{checkniigz-methods}
\alias{checkniigz}
\alias{checkniigz,nifti-method}
\alias{checkniigz,ANY-method}
\alias{checkniigz,factor-method}
\alias{checkniigz,character-method}
\alias{checkniigz,list-method}
\alias{ensure_nii_gz}
\title{Force object to filename with .nii.gz extension}
\usage{
checkniigz(file, ...)

\S4method{checkniigz}{nifti}(file, ...)

\S4method{checkniigz}{ANY}(file, ...)

\S4method{checkniigz}{factor}(file, ...)

\S4method{checkniigz}{character}(file, ...)

\S4method{checkniigz}{list}(file, ...)

ensure_nii_gz(file, ...)
}
\arguments{
\item{file}{character or \code{nifti} object}

\item{...}{options passed to \code{\link{checkimg}}}
}
\value{
Character filename of image or temporary nii, 
with .nii.gz extension
}
\description{
Ensures the output to be a character filename (or vector) 
from an input
image or \code{nifti}, to be gzipped and has \code{.nii.gz} extension
}
\examples{
set.seed(5)
dims = rep(10, 3)
arr = array(rnorm(prod(dims)), dim = dims)
arr[,,10] = 0
nim = oro.nifti::nifti(arr)
rnifti = RNifti::asNifti(nim)
timg = tempimg(nim)
limg = list(factor(timg), factor(timg))
func = checkniigz
func(nim)
func(rnifti)
func(timg)
func(limg)
}
\author{
John Muschelli \email{muschellij2@gmail.com}
}
