from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Diff(db.Model):
    __tablename__ = 'difficulties'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    turn_count = db.Column(db.Integer, nullable=False)
    multiplier = db.Column(db.Float, nullable=False)
    level_id = db.Column(db.Integer, db.ForeignKey('levels.id'), nullable=True)
    run = db.relationship('Run', backref='difficulty', cascade="all,delete")


class Level(db.Model):
    __tablename__ = 'levels'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    level_name = db.Column(db.String(128), nullable=False)
    difficulty = db.relationship('Diff', backref='lvl', cascade="all,delete")
    run = db.relationship('Run', backref='lvl', cascade="all,delete")


class Run(db.Model):
    def __init__(self, player_name: str, score: float, level_id: int, diff_id: int):
        self.player_name = player_name
        self.score = score
        self.level_id = level_id
        self.diff_id = diff_id

    __tablename__ = 'runs'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    player_name = db.Column(db.String(128), unique=True, nullable=False)
    score = db.Column(db.Float, nullable=False)
    level_id = db.Column(db.Integer, db.ForeignKey('levels.id'), nullable=True)
    diff_id = db.Column(db.Integer, db.ForeignKey(
        'difficulties.id'), nullable=True)

    def serialize(self):
        return {
            'id': self.id,
            'player_name': self.player_name,
            'score': self.score,
            'level_id': self.level_id,
            'diff_id': self.diff_id
        }
