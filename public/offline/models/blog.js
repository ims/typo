$.Model.extend('Blog',
/* @Static */
{
    /**
     * Retrieves blogs data.
     * @param {Object} params - params that might refine your results.
     * @param {Function} success - a callback function that returns wrapped blog objects.
     * @param {Function} error - a callback function for an error.
     */
    settings: function(params,success,error) {
        db.transaction(function(tx) {
            tx.executeSql("SELECT * FROM blogs WHERE id=?", [1],
                function(tx, rs) {
                    if(rs.rows.length > 0) {
                        var row = rs.rows.item(0)
                        var settings = row['settings'].split('\n')
                        var result = new Array()
                        var data

                        //we start from index 1 because first row is only '---' string
                        for(var i=1;i<settings.length;i++) {
                            data = settings[i].split(':')
                            result[data[0]] = data[1]
                            data = null
                        }
                        return success(result)
                    }
                },function(tx,err){
                    return error(err)
                })
        })
    },
},
/* @Prototype */
{
})