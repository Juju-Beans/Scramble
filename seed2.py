"""
Populate scramble database with fake data using the SQLAlchemy ORM.
"""

import random
import string
import hashlib
import secrets
from faker import Faker
from scramble.src.models import Diff, Level, Run, db
from scramble.src import create_app

RUN_COUNT = 50
LEVEL_COUNT = 2
DIFF_COUNT = 2

# assert LIKE_COUNT <= (RUN_COUNT * TWEET_COUNT)


def random_passhash():
    """Get hashed and salted password of length N | 8 <= N <= 15"""
    raw = ''.join(
        random.choices(
            string.ascii_letters + string.digits + '!@#$%&',  # valid pw characters
            k=random.randint(8, 15)  # length of pw
        )
    )

    salt = secrets.token_hex(16)

    return hashlib.sha512((raw + salt).encode('utf-8')).hexdigest()


def truncate_tables():
    """Delete all rows from database tables"""
    Diff.query.delete()
    Level.query.delete()
    Run.query.delete()
    db.session.commit()


def random_score_generator():
    """ Generate random score """
    points = random.randint(0, 150)
    return points


def main():
    """Main driver function"""
    app = create_app()
    app.app_context().push()
    truncate_tables()
    fake = Faker()

    level_data = None  # save last level played
    title = ["ADVANCED", "NOVICE"]
    # chosen_title = title.pop(title.index(random.choice(title)))

    for x in title:
        level_data = Level(level_name=x)
        db.session.add(level_data)

    # insert levels
    db.session.commit()

    diff_data = None  # save last difficulty
    turns = [5, 10]
    m = [1.5, 1]
    lvl_id = [level_data.id-1, level_data.id]

    for x in range(DIFF_COUNT):
        diff_data = Diff(
            turn_count=turns[x],
            multiplier=m[x],
            level_id=lvl_id[x]
        )
        db.session.add(diff_data)

    # inset difficulty types
    db.session.commit()

    run_data = None  # save last run
    df_id = [diff_data.id[0], diff_data.id[1]]

    for x in range(RUN_COUNT):
        run_data = Run(
            player_name=fake.unique.first_name().lower() + str(random.randint(1, 150)),
            # password=random_passhash(),
            score=random_score_generator(),
            level_id=random.choice[lvl_id],
            diff_id=random.choice[df_id]
        )
        db.session.add(run_data)

    # insert runs
    db.session.commit()


# run script
main()
