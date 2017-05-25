FactoryGirl.define do
  factory :proposal do
    title "MyString"
    principal_researcher "MyString"
    coresearchers "MyText"
    rdCost 1.5
    sourceExternal "MyString"
    amountExternal "MyString"
    facMat "MyText"
    objectives "MyText"
    expectedOutputs "MyText"
    description "MyText"
    weeklyHours "MyString"
    endorsement false
    submitAgency false
    listAgency "MyText"
    attachment { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'sample', 'sample_upload.pdf')) }
  end
end
