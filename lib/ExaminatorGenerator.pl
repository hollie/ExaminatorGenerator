package ExaminatorCreator;

# VERSION

use Moose;
use namespace::autoclean;
use 5.012;
use autodie;
use Log::Log4perl qw(:easy);
use Params::Validate;
use ExaminatorCreatorDb;
#use Data::Dumper;

use Carp qw/croak carp/;

has database => (
    is => 'ro',
    isa => 'Str',
    default => $ENV{'DATABASE'} || '../lib/stlucas.db'
	);

has dry_run => (
	is => 'ro',
	isa => 'Int',
	default => 0
	);
	
# Actions that need to be run after the constructor
sub BUILD {
    my $self = shift;

    # Connect to the database
    $self->{schema} = $self->get_schema();
    
}

sub get_schema {
	my $self = shift;
  	return ExaminatorCreatorDb->connect('dbi:SQLite:database=' . $self->database() , '', '') || die "Cannot connect to database\n";
}

sub get_diensten {
	my $self = shift();
	
	my $diensten   = $self->{schema}->resultset('Diensten');
	my $count  = $diensten->count;

	return $count;		
}

# Speed up the Moose object construction
__PACKAGE__->meta->make_immutable;
no Moose;
1;

# ABSTRACT: Create and report batches of devices on the production database

=head1 SYNOPSIS

my $object = ExaminatorCreator->new();

=head1 DESCRIPTION


=head1 METHODS

=head2 C<new(%parameters)>

This constructor returns a new object. Supported parameters are listed below

=over

=item database 

Optional path to the database file, defaults to ../lib/xxx.db. Can be overridden with
the environment parameter 'DATABASE'.

=item dry-run  

Optional parameter that allows to test the effect of a certain operation without actually executing it

=back

=head2 C<get_schema>

Returns a handle to the database



=head2 BUILD

Helper function to run custome code after the object has been created by Moose.

=cut

1;