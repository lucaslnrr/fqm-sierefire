"""add show office name display screen option

Revision ID: 8569b9b22f2b
Revises: 8ffacb72310b
Create Date: 2025-02-20 19:33:07.239732

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '8569b9b22f2b'
down_revision = '8ffacb72310b'
branch_labels = None
depends_on = None


def upgrade():
    try:
        op.add_column('displays', sa.Column('show_office_name', sa.BOOLEAN(), nullable=True))
    except Exception:
        pass


def downgrade():
    try:
        op.drop_column('displays', 'show_office_name')
    except Exception:
        pass
