import AWSDynamoDB

class User: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    @objc private var id: NSNumber = 0
    @objc private var email: String = ""
    @objc private var password: String = ""

    class func dynamoDBTableName() -> String {
        return "user"
    }

    class func hashKeyAttribute() -> String {
        return "id"
    }
}
