require "spec_helper"

describe Orghunter::Geolocation do
  Orghunter.configure do |config|
    config.api_key = ENV['ORGHUNTER_API_KEY']
  end

  args = {
    "ein" => "930748388",
    "name" => "COMMUNITY CANCER FOUNDATION COMMUNITY CANCER CENTER",
    "inCareOfName" => "",
    "street" => "2880 NW STEWART PKWY STE 100",
    "city" => "ROSEBURG",
    "state" => "OR",
    "zipCode" => "97471-1203",
    "country" => "USA",
    "groupExemption" => nil,
    "subsection" => "501(c)(3)",
    "classification" => "Scientific Organization",
    "affiliation" => "Independent - This code is used if the organization is an independent organization or an independent auxiliary (i.e., not affiliated with a National, Regional, or Geographic grouping of organizations).",
    "rullingDate" => "December, 1979",
    "deductibility" => "Contributions are deductible.",
    "deductibilityStatus" => "PC",
    "foundation" => "Hospital or medical research organization 170(b)(1)(A)(iii)",
    "activity1" => "Health clinic",
    "activity2" => "Other health services",
    "activity3" => nil,
    "organization" => "Corporation",
    "exemptStatus" => "Unconditional Exemption",
    "taxPeriod" => "June, 2016",
    "assetCodeDesc" => "10,000,000 to 49,999,999",
    "incomeCodeDesc" => "5,000,000 to 9,999,999",
    "filingRequirementCodeDesc " => "(all other) or 990EZ return",
    "pfFilingRequirementCodeDesc" => "No PF return",
    "accountingPeriod" => "June",
    "assetAmount" => "16204110.00",
    "incomeAmount" => "5153522.00",
    "form990" => "5145021.00",
    "nteeCd" => "G30",
    "nteeClass" => "Cancer",
    "nteeType" => "Diseases, Disorders, Medical Disciplines",
    "sortName" => "",
    "revocationDt" => nil,
    "revPostingDt" => nil,
    "irsRevocationStatus" => nil,
    "acceptingDonations" => "1",
    "latitude" => "43.240814",
    "longitude" => "-123.363449"}

    let(:geolocation){OrgHunter.Geolocation.new(args)}

    it 'should exist' do
      expect(geolocation).to be_kind_of(OrgHunter::Geolocation)
    end

    it 'has readable ein' do
      expect(geolocation.ein).to eq('930748388')
    end

    it 'has readable name' do
      expect(geolocation.name).to eq('COMMUNITY CANCER FOUNDATION COMMUNITY CANCER CENTER')
    end

    it 'has readable inCareOfName' do
      expect(geolocation.inCareOfName).to eq('')
    end

    it 'has readable street' do
      expect(geolocation.street).to eq('2880 NW STEWART PKWY STE 100')
    end

    it 'has readable city' do
      expect(geolocation.city).to eq('ROSEBURG')
    end

    it 'has readable state' do
      expect(geolocation.state).to eq('OR')
    end

    it 'has readable zipCode' do
      expect(geolocation.zipCode).to eq('97471-1203')
    end

    it 'has readable country' do
      expect(geolocation.country).to eq('USA')
    end

    it 'has readable groupExemption' do
      expect(geolocation.groupExemption).to be_nil
    end

    it 'has readable subsection' do
      expect(geolocation.subsection).to eq('501(c)(3)')
    end

    it 'has readable classification' do
      expect(geolocation.classification).to eq('Scientific Organization')
    end

    it 'has readable affiliation' do
      expect(geolocation.affiliation).to eq('Independent - This code is used if the organization is an independent organization or an independent auxiliary (i.e., not affiliated with a National, Regional, or Geographic grouping of organizations).')
    end

    it 'has readable rullingDate' do
      expect(geolocation.rullingDate).to eq('December, 1979')
    end

    it 'has readable deductibility' do
      expect(geolocation.deductibility).to eq('Contributions are deductible.')
    end

    it 'has readable deductibilityStatus' do
      expect(geolocation.deductibilityStatus).to eq('PC')
    end

    it 'has readable foundation' do
      expect(geolocation.foundation).to eq('Hospital or medical research organization 170(b)(1)(A)(iii)')
    end

    it 'has readable activity1' do
      expect(geolocation.activity1).to eq('Health clinic')
    end

    it 'has readable activity2' do
      expect(geolocation.activity2).to eq('Other health services')
    end

    it 'has readable activity3' do
      expect(geolocation.activity3).to be_nil
    end

    it 'has readable organization' do
      expect(geolocation.organization).to eq('Corporation')
    end

    it 'has readable exemptStatus' do
      expect(geolocation.exemptStatus).to eq('Unconditional Exemption')
    end

    it 'has readable taxPeriod' do
      expect(geolocation.taxPeriod).to eq('June, 2016')
    end

    it 'has readable assetCodeDesc' do
      expect(geolocation.assetCodeDesc).to eq('10,000,000 to 49,999,999')
    end

    it 'has readable incomeCodeDesc' do
      expect(geolocation.incomeCodeDesc).to eq('5,000,000 to 9,999,999')
    end

    it 'has readable filingRequirementCodeDesc' do
      expect(geolocation.filingRequirementCodeDesc).to eq('(all other) or 990EZ return')
    end

    it 'has readable pfFilingRequirementCodeDesc' do
      expect(geolocation.pfFilingRequirementCodeDesc).to eq('No PF return')
    end

    it 'has readable accountingPeriod' do
      expect(geolocation.accountingPeriod).to eq('June')
    end

    it 'has readable assetAmount' do
      expect(geolocation.assetAmount).to eq('16204110.00')
    end

    it 'has readable incomeAmount' do
      expect(geolocation.incomeAmount).to eq('5153522.00')
    end

    it 'has readable form990' do
      expect(geolocation.form990).to eq('5145021.00')
    end

    it 'has readable nteeCd' do
      expect(geolocation.nteeCd).to eq('G30')
    end

    it 'has readable nteeClass' do
      expect(geolocation.nteeClass).to eq('Cancer')
    end

    it 'has readable nteeType' do
      expect(geolocation.nteeType).to eq('Diseases, Disorders, Medical Disciplines')
    end

    it 'has readable sortName' do
      expect(geolocation.sortName).to eq('')
    end

    it 'has readable revocationDt' do
      expect(geolocation.revocationDt).to be_nil
    end

    it 'has readable revPostingDt' do
      expect(geolocation.revPostingDt).to be_nil
    end

    it 'has readable irsRevocationStatus' do
      expect(geolocation.irsRevocationStatus).to be_nil
    end

    it 'has readable acceptingDonations' do
      expect(geolocation.acceptingDonations).to eq('1')
    end

    it 'has readable latitude' do
      expect(geolocation.latitude).to eq('43.240814')
    end

    it 'has readable longitude' do
      expect(geolocation.longitude).to eq('-123.363449')
    end

end
