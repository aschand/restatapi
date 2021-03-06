% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filter_raw_data.R
\name{filter_raw_data}
\alias{filter_raw_data}
\title{Filter raw data locally}
\usage{
filter_raw_data(raw_data, filter_table, date_filter = FALSE)
}
\arguments{
\item{raw_data}{an input data.table dataset resulted from the call of the \code{\link{get_eurostat_raw}} function}

\item{filter_table}{a data table with values for the concepts or time to be filtered out}

\item{date_filter}{if \code{TRUE} the filter table should be applied to the \code{time} columns of the \code{raw_data}. The default is \code{FALSE}, 
in this case the filters applied to the other columns of \code{raw_data}.}
}
\value{
a filtered data.table containing only the rows of \code{raw_data} which fulfills the conditions in the \code{filter_table}
}
\description{
Filter downloaded full raw dataset on local computer if the \code{\link{get_eurostat_data}} has not provide data due to too large datasets for the REST API.
}
\details{
It is a sub-function to use in the \code{\link{get_eurostat_data}} to filter data if the direct response from REST API did not provide data because of to large data set. 
         The \code{filter_table} contains always at least two columns. In case if \code{date_filter=TRUE} then the two columns should have the following names:
         \tabular{ll}{
           \code{sd} \tab Starting date to be included, where date is formatted yyyy[-mm][-dd] \cr
           \code{ed} \tab End date of the period to be included in the dataset formatted yyyy[-mm][-dd] 
           }  
         In this case these conditions are applied to the time column of the the \code{raw_data} data.table. 
         In case if \code{date_filter=FALSE} then the columns should have the following names:
         \tabular{ll}{
           \code{concept} \tab Eontaining concept names, which is a column name in the \code{raw_data} data.table \cr
           \code{code} \tab A possible code under the given concept, which is a value in the column of the \code{raw_data} data.table defined by the concept in the \code{filter_table}   
           }
}
\examples{
\dontshow{

}
\donttest{
id<-"tus_00age"
rd<-get_eurostat_raw(id)
dsd<-get_eurostat_dsd(id)
ft<-create_filter_table(c("TIME_SP","Hungary",'T'),FALSE,dsd)
filter_raw_data(rd,ft)
}

}
\seealso{
\code{\link{get_eurostat_raw}}, \code{\link{search_eurostat_dsd}}, \code{\link{get_eurostat_data}}, \code{\link{create_filter_table}}
}
