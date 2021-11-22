from flask import Blueprint, jsonify, abort, request
from ..models import Run, db

bp = Blueprint('runs', __name__, url_prefix='/runs')


@bp.route('', methods=['GET'])
def index():
    games_ran = Run.query.all()
    result = []
    for g in games_ran:
        result.append(g.serialize())
    return jsonify(result)


@bp.route('', methods=['POST'])
def create():
    if 'player_name' not in request.json or 'id' not in request.json:
        return abort(400)
    Run.query.get_or_404(request.json['player_name'])
    # construct game ran
    g = Run(
        player_name=request.json['player_name'],
        score=request.json['score'],
        level_id=request.json['level_id'],
        diff_id=request.json['diff_id']
    )
    db.session.add(g)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement
    return jsonify(g.serialize())


@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    g = Run.query.get_or_404(id)
    try:
        db.session.delete(g)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)


@bp.route('/<int:id>', methods=['PUT'])
def update(id: int):
    r = Run.query.get_or_404(id)
    try:
        if 'player_name' in request.json:
            r.player_name = request.json['player_name']
        # db.session.update(u)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)


@bp.route('/<int:id>', methods=['PUT'])
def update(id: int):
    r = Run.query.get_or_404(id)
    try:
        if 'score' in request.json:
            r.score = request.json['score']
        # db.session.update(u)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)
