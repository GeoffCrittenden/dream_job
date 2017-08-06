JOBS_URL               = ENV['JOBS_URL']               || DreamJob::CONFIG.job_info.base_url
NO_JOBS_MESSAGE        = ENV['NO_JOBS_MESSAGE']        || DreamJob::CONFIG.job_info.no_jobs_string
JOBS_AVAILABLE_MESSAGE = ENV['JOBS_AVAILABLE_MESSAGE'] || DreamJob::CONFIG.job_info.jobs_avail_string
SITE_DOWN_MESSAGE      = ENV['SITE_DOWN_MESSAGE']      || DreamJob::CONFIG.job_info.site_down_string

TWILIO_ACCT_SID        = ENV['TWILIO_ACCT_SID']        || DreamJob::CONFIG.twilio.acct_sid
TWILIO_AUTH_TOKEN      = ENV['TWILIO_AUTH_TOKEN']      || DreamJob::CONFIG.twilio.auth_token
FROM_PHONE_NUMBER      = ENV['FROM_PHONE_NUMBER']      || DreamJob::CONFIG.twilio.phone_number

TO_PHONE_NUMBER        = ENV['TO_PHONE_NUMBER']        || DreamJob::CONFIG.phone_info.phone_number
