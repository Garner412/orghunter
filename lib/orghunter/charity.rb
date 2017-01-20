module Orghunter
  class Charity
    attr_reader :accepting_donations, :accounting_period, :activity1, :activity2, :activity3, :affiliation, :asset_amount, :asset_code_desc, :category, :city, :classification, :country, :deductibility, :deductibility_status, :donation_URL, :ein, :eligible_cd, :exempt_status, :filing_requirement_code_desc, :form990, :foundation, :group_exemption, :in_care_of, :income_amount, :income_code_desc, :irs_revocation_status, :latitude, :longitude, :mission, :name, :ntee_cd, :ntee_class, :ntee_type, :org_hunter_URL, :organization, :pf_filing_requirement_code_desc, :rev_posting_dt, :revocation_dt, :ruling_date, :search_score, :sort_name, :state, :status, :street, :subsection, :tax_period, :website, :zip_code

    def initialize(args)
      @accepting_donations = args["acceptingDonations"]
      @accounting_period = args["accountingPeriod"]
      @activity1 = args['activity1']
      @activity2 = args['activity2']
      @activity3 = args['activity3']
      @affiliation = args['affiliation']
      @asset_amount = args["assetAmount"]
      @asset_code_desc = args['assetCodeDesc']
      @category = args["category"]
      @city = args["city"]
      @classification = args['classification']
      @country = args['country']
      #deductability_cd
      @deductability_cd = args["deductibilityCd"]
      @deductibility = args['deductibility']
      @deductibility_status = args['deductibilityStatus']
      @donation_URL = args["donationUrl"]
      @ein = args["ein"]
      @eligible_cd = args["eligibleCd"]
      @exempt_status = args['exemptStatus']
      # there is a space at the end of this data descriptor!!!
      @filing_requirement_code_desc = args['filingRequirementCodeDesc ']
      @form990 = args["form990"]
      @foundation = args['foundation']
      @group_exemption = args['groupExemption']
      @in_care_of = args["inCareOfName"]
      @income_amount = args["incomeAmount"]
      @income_code_desc = args['incomeCodeDesc']
      @irs_revocation_status = args["irsRevocationStatus"]
      @latitude = args["latitude"]
      @longitude = args["longitude"]
      @mission = args["missionStatement"]
      @name = args["charityName"] || args["name"]
      @ntee_cd = args['nteeCd']
      @ntee_class = args["nteeClass"]
      @ntee_type = args["nteeType"]
      @org_hunter_URL = args["url"]
      @organization = args['organization']
      # Ruling is spelled wrong!
      @pf_filing_requirement_code_desc = args["pfFilingRequirementCodeDesc"]
      @rev_posting_dt = args["revPostingDt"]
      @revocation_dt = args["revocationDt"]
      @ruling_date = args['rullingDate']
      @search_score = args["score"]
      @sort_name = args["sortName"]
      @state = args["state"]
      @status = args["statusCd"]
      @street = args['street']
      @subsection = args['subsection']
      @tax_period = args['taxPeriod']
      @website = args["website"]
      @zip_code = args["zipCode"]

    end

    def deductable?
      @deductability_cd == 1
    end

    def eligible?
      @eligible_cd == 1
    end

    def accepting_donations?
      @accepting_donations.to_i == 1
    end

  end
end
