FactoryGirl.define do
  factory :proposal do
    title "MyString"
    principalResearcher "MyString"
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
    attachment "MyString"
  end
end
