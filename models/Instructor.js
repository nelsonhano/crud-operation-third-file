const { query } = require('./connection');
const Model = require('./Model');
class Instructor extends Model {
    async save() {
        let staff_no = 1;
        let sql = `SELECT staff_no from instructors order by id desc limit 1`;
        let result = await query(sql);
        if (result.length > 0) {
            staff_no = Number(result[0].staff_no) + 1;
        }          
        this.staff_no = staff_no.toString().padStart(4, '0');
        await super.save();
    }

    get name() {
        return `${this.title} ${this.surname.toUpperCase()} ${this.first_name} ${this.other_name}`;
    }
}

module.exports = Instructor;